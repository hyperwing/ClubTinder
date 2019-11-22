# Created 11/09/2019 by Sharon Qiu
# Edited 11/17/2019 by Leah Gillespie
# Edited 11/17/2019 by Sharon Qiu

# Controller for club matches page

class ClubMatchesController < ApplicationController

  before_action :set_club_match, only: [:show, :edit, :update, :destroy]

  # GET /club_matches
  # GET /club_matches.json
  def index
    @club_matches = ClubMatch.all
  end

  # GET /club_matches/1
  # GET /club_matches/1.json
  def show
  end

  # GET /club_matches/new
  def new
    @club_match = ClubMatch.new
  end

  # GET /club_matches/1/edit
  def edit
  end

  # POST /club_matches
  # POST /club_matches.json
  def create
    @club_match = ClubMatch.new(club_match_params)

    respond_to do |format|
      if @club_match.save
        format.html { redirect_to @club_match, notice: 'Club match was successfully created.' }
        format.json { render :show, status: :created, location: @club_match }
      else
        format.html { render :new }
        format.json { render json: @club_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # Created 11/14/2019 by Sharon Qiu
  # updates club match
  def update_existing_match
    @current_user = User.find(params[:id])
    @current_club_match = ClubMatch.find_by(club_id:params[:club], user_id:params[:id])
    if @current_club_match.matched == 1 || @current_club_match.matched == true
      if @current_club_match.update(matched: 0)
        @current_club_match.reload
      else
        flash[:notice] = "Unable to update matched status."
      end
      redirect_to request.referrer
    else
      if @current_club_match.update(matched: 1)
        @current_club_match.reload
      else
        flash[:notice] = "Unable to update matched status."
      end
      redirect_to request.referrer
    end
  end

  
  # DELETE /club_matches/1
  # DELETE /club_matches/1.json
  def destroy
    @club_match.destroy
    respond_to do |format|
      format.html { redirect_to club_matches_url, notice: 'Club match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def swipe
    @potential_matches =[]
    clubs_by_weight = choose
    clubs_by_weight.each do |curr_club|
      c = Club.where name: curr_club[0].name
      @potential_matches.push c
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_match 
      @club_match = ClubMatch.find(current_user.id)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_match_params
      params.require(:club_match).permit(:club_id, :user_id, :matched)
    end

end
