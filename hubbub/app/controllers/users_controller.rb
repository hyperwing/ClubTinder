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
# File Edited 11/21/2019 by Neel Mansukhani: Fixed query again again
# Edited 11/21/2019 by Neel Mansukhani: Changed redirect on confirm
# Edited 11/21/2019 by David Wing: Changed redirect to profile
# Edited 11/21/2019 by David Wing: fixed bug for no selected interests
# Edited 11/21/2019 by Neel Mansukhani: Changed root

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

  # Created 11/17/19 by David Wing
  def select_user_interests
    @interests = Interest.all
    # current user interests
    @user_interests = UserInterest.where(:user_id => current_user.id);
    @cur_u = current_user

  end

  # Created 11/17/19 by David Wing
  # Edited 11/21/2019 by David Wing
  def handle_check_boxes

    @cur_u = current_user

    tag_ids = params[:tag_ids]
    logger.debug("tag_ids: " +tag_ids.to_s)

    @interests = Interest.all
    # if box checked, add to model, else destroy from model
    @interests.each do |i_box|
        # Set the interest information from form to instance variable
        @interest_info = i_box.id

        logger.debug("handling " +i_box.name.to_s)
        logger.debug("tag_ids: " +tag_ids.to_s)

        if (!tag_ids.nil?) && (tag_ids.include? i_box.id.to_s)

            logger.debug("creating new user_interest")

            # Where user_interests already has an entry for user
            if (UserInterest.where(:interest_id => i_box.id).where(:user_id => current_user.id)).count == 0
            
                new_interest = UserInterest.new
                new_interest.user_id = current_user.id
                new_interest.interest_id = i_box.id
        
                if new_interest.save
                    logger.debug("saved successfully")  
                else    
                    logger.debug("failed to save")  
                end
            end

        else
            logger.debug("deleting user_interest")

            UserInterest.where(:user_id => current_user.id)
                .where(:interest_id =>i_box.id).destroy_all
            
        end
    end
    redirect_to '/users/'+current_user.id.to_s
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
    if @user == current_user || @user.role == "admin"
      @matched_clubs = Club.left_joins(:club_matches)
      .where(:club_matches => {matched: 1})
      .left_joins(:users)
      .where(:club_matches => {user_id: params[:id]})
      .where(:users => {id: params[:id]})
    else
      flash[:notice] = "Attempted access to restricted page. Redirecting..."
      redirect_to @user
    end
  end

  # Created 11/17/2019 by Sharon Qiu
  # Edited 11/21/2019 by Sharon Qiu: Fixed query
  # Gets the rejections
  def not_matched
    @user = User.find_by(id:params[:id])
    if @user == current_user || @user.role == "admin"
      @not_matched_clubs = Club.left_joins(:club_matches)
      .where(:club_matches => {matched: 0})
      .left_joins(:users)
      .where(:club_matches => {user_id: params[:id]})
      .where(:users => {id: params[:id]})
    else
      flash[:notice] = "Attempted access to restricted page. Redirecting..."
      redirect_to @user
    end
  end

  # Created 11/13/2019 by Sri Ramya Dandu
  # Obtains params from stats and parses for correct users 
  # Edited 11/15/2019 by Sri Ramya Dandu: Parsing functionality
  # Edited 11/21/2019 by David Wing: graph data
  # Edited 11/22/2019 by David Wing: updated graph data
  def display_stats
    
    if current_user && current_user.role == "admin"
      @valuesArray = params.values[0,(params.values).length-2]
      @keysArray = params.keys[0,(params.keys).length-2]
      @match_data = ClubMatch.joins(:club).where(:matched=>1).order('COUNT(club_matches.club_id)DESC').limit(5)
      @user_interest_data = UserInterest.joins(:interest).order('COUNT(user_interests.interest_id)DESC').limit(7)
      @club_interest_data = ClubInterest.joins(:interest).order('COUNT(club_interests.interest_id)DESC').limit(7)
    
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
  # Edited 11/21/2019 by Sri Ramya Dandu: Added validations and redirection
  # Allows admin to create dummy user
  def create

    if current_user && current_user.role == "admin"
      @user = User.new(new_user_params)

      if @user.save
        @interests = []
        @matched_clubs = 0;
        @rejected_clubs = 0;
        render :show
      else
        flash[:alert] = "User with email #{params[:email]} already exists!"
        redirect_to users_new_url
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

  def root
    if current_user.club?
      redirect_to clubs_my_club_path
    else
      redirect_to club_matches_swipe_path
    end
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
