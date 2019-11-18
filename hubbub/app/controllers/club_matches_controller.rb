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

  # PATCH/PUT /club_matches/1
  # PATCH/PUT /club_matches/1.json
  def update

    if @club_match.matched == 1
      ClubMatch.find(params[:id]).update_attributes(:matched: 0)
    else
      ClubMatch.find(params[:id]).update_attributes(:matched: 1)
    end
    
      # respond_to do |format|
    #   if @club_match.update(club_match_params)
        
    #     format.html { redirect_to @club_match, notice: 'Club match was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @club_match }
    #   else
    #     format.html { render :edit }
    #     format.json { render json: @club_match.errors, status: :unprocessable_entity }
    #   end
    # end
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club_match
      @club_match = ClubMatch.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_match_params
      params.fetch(:club_match, {})
    end
end
