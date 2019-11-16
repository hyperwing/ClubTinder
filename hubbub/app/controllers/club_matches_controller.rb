# Created 11/09/2019 by Sharon Qiu
# Controller for club matches page

class ClubMatchesController < ApplicationController
  #before_action :user_signed_in?

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

  # GET /clubs/1/edit
  def edit
  end

  # POST /clubs
  # POST /clubs.json
  def create
    @club_match = ClubMatch.new(club_match_params)

    respond_to do |format|
      if @club_match.save
        format.html { redirect_to @club_match, notice: 'Club Match was successfully created.' }
        format.json { render :show, status: :created, location: @club_match }
      else
        format.html { render :new }
        format.json { render json: @club_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clubs/1
  # PATCH/PUT /clubs/1.json
  def update
    respond_to do |format|
      if @club_match.update(club_match_params)
        format.html { redirect_to @club_match, notice: 'Club Match was successfully updated.' }
        format.json { render :show, status: :ok, location: @club_match }
      else
        format.html { render :edit }
        format.json { render json: @club_match.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clubs/1
  # DELETE /clubs/1.json
  def destroy
    @club_match.destroy
    respond_to do |format|
      format.html { redirect_to club_matches_url, notice: 'Club Match was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def matches
    current_user = 1
    @matched = ClubMatch.where(user_id: current_user).where(matched: 1)
    
    #@matched_clubs = ClubMatch.joins(:clubs).where
    
  end

end
