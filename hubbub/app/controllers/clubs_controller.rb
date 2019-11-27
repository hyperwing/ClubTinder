# Edited 11/13/2019 by Leah Gillespie
# Edited 11/20/2019 by Neel Mansukhani: Choose now considers interests for rating.
# Edited 11/21/2019 by Neel Mansukhani: New club updates club id for user too.
# Edited 11/21/2019 by Neel Mansukhani: Fixed destroy
# Edited 11/22/2019 by David Wing: added model references for club stats
# Edited 11/26/2019 by Leah Gillespie: cleaned up unnecessary comments from code
require 'csv'

class ClubsController < ApplicationController
  before_action only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    if current_user.role == "admin"
      @clubs = Club.all
    else
      redirect_to new_user_session_path
    end
  end

  # GET /clubs/1
  # GET /clubs/1.jsons
  def show
    #redirect_to club_interests_select_club_interests_urls
    if current_user.nil? || current_user.role != "1"
      @club = Club.find(params[:id])
    else
      redirect_to clubs_my_club_path
    end
  end

  # GET /clubs/new
  def new
    @club = Club.new
  end

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club = Club.new(club_params)
    respond_to do |format|
      if @club.save
        format.html { redirect_to club_interests_select_club_interests_path, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
    current_user.update_attributes(:club_id => @club.id)
    current_user.save
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club.update(club_params)
        format.html { redirect_to @club, notice: 'Club was successfully updated.' }
        format.json { render :show, status: :ok, location: @club }
      else
        format.html { render :edit }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    Club.find_by(id: params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to clubs_url, notice: 'Club was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # Created 11/13/2019 by Leah Gillespie
  # Adds parsed data to database
  def add_from_csv
    CSV.foreach 'clubs.json.csv', :headers =>true do |row|
      Club.create! row.to_hash
    end
  end

  # Created 11/20/2019 by Neel Mansukhani
  # returns the club that belongs to a given user
  def my_club
    if current_user.club_id.nil?
      redirect_to new_club_path
    else

      @club = Club.find(current_user.club_id)

      @club_match_data = ClubMatch.where(:matched=> 1).where(club_id: @club.id).group_by_day(:created_at).count
      @user_interest_data = UserInterest.left_joins(:interest).where(user_id: @club.users).group(:name).limit(5).order('COUNT(interests.id) DESC').count
      @gender_data = ClubMatch.left_joins(:user).where(club_id: @club.id).where(:matched=> 1).group(:gender).count
      @match_data = ClubMatch.joins(:club).where(:matched=>1).order('COUNT(club_matches.club_id)DESC').limit(5)

      logger.debug("xxxxxxxxxxxxxxxxxxxxxx")
      @users_x = User.left_joins(:club_matches).where("\"club_matches\".club_id=:cid AND \"club_matches\".matched=1", cid:@club.id)

      @club_interests = Interest.joins(:club_interests).where("club_id==:cid", cid:current_user.club_id)
      @club_has_matches = ClubMatch.where(club_id: @club.id).count >0
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :string, :mission, :string, :affiliations, :string, :link, :string, :img, :string, :location, :string, :other, :string)
    end
end
