class ClubInterestsController < ApplicationController
  def create
    @clubInterest = ClubInterest.new(club_params)
    respond_to do |format|
      if @clubInterest.save
        format.html { redirect_to @clubInterest, notice: 'Club was successfully created.' }
        format.json { render :show, status: :created, location: @clubInterest }
      else
        format.html { render :new }
        format.json { render json: @clubInterest.errors, status: :unprocessable_entity }
      end
    end
  end


end
