# Edited 11/13/2019 by Leah Gillespie

require 'csv'

class ClubsController < ApplicationController
  before_action :set_club, only: [:show, :edit, :update, :destroy]

  # GET /clubs
  # GET /clubs.json
  def index
    @clubs = Club.all
  end
  # Created 11/16/2019 by Neel Mansukhani
  # GET /clubs/choose
  def choose
    other_users = User.all.where.not id: current_user.id
    clubs = Hash.new 0
    other_users.each do |other_user|
      common_clubs = other_user.clubs & current_user.clubs
      weight = (common_clubs.length.to_f * 100/ other_user.clubs.length).round(2)
      other_user.clubs.each do |club|
        if !common_clubs.include? club
          clubs[club] += weight
        end
      end
    end
    @clubs = clubs.sort_by{ |k, v| v }.reverse
  end
  # GET /clubs/1
  # GET /clubs/1.json
  def show
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
        format.html { redirect_to @club, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @club }
      else
        format.html { render :new }
        format.json { render json: @club.errors, status: :unprocessable_entity }
      end
    end
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
    @club.destroy
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

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_club
      @club = Club.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def club_params
      params.require(:club).permit(:name, :string, :mission, :string, :affiliations, :string, :link, :string, :img, :string, :location, :string, :other, :string)
    end
end
