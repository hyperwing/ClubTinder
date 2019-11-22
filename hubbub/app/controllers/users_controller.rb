# File created 11/12/2019 by Sri Ramya Dandu
# File edited 11/13/2019 by Sri Ramya Dandu: Added CRUD operations 
# File edited 11/13/2019 by Sri Ramya Dandu: Added stats displays 
# File edited 11/15/2019 by Sri Ramya Dandu: Edit changes reflected in the database 
# File edited 11/15/2019 by Sri Ramya Dandu: Added destory and new view for admin 
# File edited 11/16/2019 by Sri Ramya Dandu: Allow admin to create dummy users 
# File edited 11/17/2019 by Sharon Qiu: Added matches and rejections querying
# File edited 11/18/2019 by Sri Ramya Dandu: Modified user display for stats query 
# File edited 11/18/2019 by Sri Ramya Dandu: Modified titles
# File edited 11/19/2019 by Sri Ramya Dandu: Explore page
# File edited 11/20/2019 by Neel Mansukhani: Added club page
# File edited 11/20/2019 by Sri Ramya Dandu: Added more data to show controller
# File edited 11/20/2019 by Sharon Qiu: Fixed query for match/unmatch.
# File edited 11/21/2019 by Sharon Qiu: Fixed query again for match/unmatch...
# File edited 11/21/2019 by Sri Ramya Dandu: Fixed show query and admin functions

class UsersController < ApplicationController
  
  include Devise::Controllers::Helpers 
  # Created 11/12/2019 by Sri Ramya Dandu
  # Shows list of all users in the database
  def index
    @user = current_user
    if @user&& @user.role == "admin"
      @title = "All Registered Users"
      @users = User.all
      @total = User.all.length
    else
      redirect_to new_user_session_path
    end 
  end

  # Created 11/13/2019 by Sri Ramya Dandu
  def stats
    @user = current_user
    if @user&& @user.role == "admin"
      @clubs = Club.all
    else
      redirect_to new_user_session_path
    end 
    
  end

  # Created 11/19/2019 by Sri Ramya Dandu
  # Shuffles all clubs for club view
  def explore
    @clubs = Club.all.shuffle
  end 

  # Created 11/17/2019 by Sharon Qiu
  # Edited 11/21/2019 by Sharon Qiu: Fixed query
  # Gets the matches
  def matched
    @user = User.find_by(id:params[:id])
    # @matched_clubs = []
    # @club_matches = @user.club_matches.map{|club| club.club_id if club.matched}.uniq.compact
    # @user_clubs = @user.clubs
    # if @user && (@user.role == "user" ||@user.role == "admin")
    #   @user_clubs.each do |club|
    #     if @club_matches.include? club.id
    #       @matched_clubs.push club
    #     end
    #   end
    # else
    #   flash[:notice] = "Attempted access to restricted page. Redirecting..."
    #   redirect_to @user
    # end
    @matched_clubs = Club.left_joins(:club_matches).where(:club_matches => {matched: 1}).left_joins(:users).where(:club_matches => {user_id: params[:id]}).where(:users => {id: params[:id]})
  end

  # Created 11/17/2019 by Sharon Qiu
  # Edited 11/21/2019 by Sharon Qiu: Fixed query
  # Gets the rejections
  def not_matched
    @user = User.find_by(id:params[:id])
    # @not_matched_clubs = []
    # @not_club_matches = @user.club_matches.map{|club| club.club_id if !club.matched}.uniq.compact
    # @user_clubs = @user.clubs
    # if @user && (@user.role == "user" ||@user.role == "admin")
    #   @user_clubs.each do |club|
    #     if @not_club_matches.include? club.id
    #       @not_matched_clubs.push club
    #     end
    #   end
    # else
    #   flash[:notice] = "Attempted access to restricted page. Redirecting..."
    #   redirect_to @user
    # end
    @not_matched_clubs = Club.left_joins(:club_matches).where(:club_matches => {matched: 0}).left_joins(:users).where(:club_matches => {user_id: params[:id]}).where(:users => {id: params[:id]})
    end

  # Created 11/13/2019 by Sri Ramya Dandu
  # Obtains params from stats and parses for correct users 
  # Edited 11/15/2019 by Sri Ramya Dandu: Parsing functionality
  def display_stats
    
    if current_user && current_user.role == "admin"
      @valuesArray = params.values[0,(params.values).length-2]
      @keysArray = params.keys[0,(params.keys).length-2]
    
      if @valuesArray[0] != "All" 
        @users = User.where("#{@keysArray[0]}": params["#{@keysArray[0]}".to_sym])
      else
        @users = User.all
      end
    

      @title = ' users'
      @keysArray.each_index{|x|
        if x > 0 && @valuesArray[x] != "" 
          @users = @users.where("#{@keysArray[x]}": params["#{@keysArray[x]}".to_sym])
        end

        if @keysArray[x] == "gender"
          @title = @valuesArray[x] + @title
        end

        if @keysArray[x] == "grad_year" && @valuesArray[x] != ""
          @title = @title + ' graduating in ' +  @valuesArray[x]
        end
      }   

      @total = @users.length
    else
      redirect_to new_user_session_path
    end 
 
  end

  # Created 11/12/2019 by Sri Ramya Dandu
  def new
    if current_user && current_user.role == "admin"
      @user = User.new 
    else
      redirect_to new_user_session_path
    end 
  end

  # Created 11/16/2019 by Sri Ramya Dandu
  # Allows admin to create dummy user
  def create

    if current_user && current_user.role == "admin"
      @user = User.new(new_user_params)

      if @user.save
        render :show
      else
        render :new
      end
    else
      redirect_to new_user_session_path
    end 

  end 
  
  # Created 11/13/2019 by Sri Ramya Dandu
  # Edited 11/21/2019 by Sri Ramya Dandu: Replaced loops with queries 
  # Shows user profile 
  def show
    @user = User.find(params[:id])
    @matches = @user.club_matches
    @matched_clubs = @matches.where(matched: "1").length
    @rejected_clubs = @matches.where(matched: "0").length
    @interests = Interest.joins(:user_interests).where(:user_interests => {user_id: current_user.id}).uniq

  end

  # Created 11/13/2019 by Sri Ramya Dandu
  # Edit the chosen user profile 
  def edit
    if current_user && current_user.role == "admin"
      @user = User.find(params[:id])
    else
      redirect_to new_user_session_path
    end 
  end

  # Created 11/13/2019 by Sri Ramya Dandu
  # Updates the user profile 
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    end
  end

  # Created 11/15/2019 by Sri Ramya Dandu
  # Deletes the user profile 
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  # Created 11/15/2019 by Sri Ramya Dandu
  def user_params
    params.require(:user).permit(:id ,:email, :first_name, :last_name, :grad_year, :gender, :role)
  end

  # Created 11/16/2019 by Sri Ramya Dandu
  # Dummy user params 
  def new_user_params
    params.permit(:email, :first_name, :last_name, :grad_year, :gender, :password, :role)
  end
end
