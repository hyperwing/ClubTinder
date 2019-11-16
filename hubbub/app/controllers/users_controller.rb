# File created 11/12/2019 by Sri Ramya Dandu
# File edited 11/13/2019 by Sri Ramya Dandu: Added CRUD operations 
# File edited 11/13/2019 by Sri Ramya Dandu: Added stats displays 
# File edited 11/15/2019 by Sri Ramya Dandu: Edit changes reflected in the database 
# File edited 11/15/2019 by Sri Ramya Dandu: Added destory and new view for admin 

class UsersController < ApplicationController
  
  include Devise::Controllers::Helpers 
  # Created 11/12/2019 by Sri Ramya Dandu
  def index
    @user = current_user
    if @user.role == "admin"
      @title = "All Registered Users"
      @users = User.where(role: "user")
      @total = User.all.length
    end
  end

  def stats
    
  end

  # Created 11/13/2019 by Sri Ramya Dandu
  # Edited 11/15/2019 by Sri Ramya Dandu: Parsing functionality
  def display_stats
    @valuesArray = params.values[0,(params.values).length-2]
    @keysArray = params.keys[0,(params.keys).length-2]
  
    @users = User.where("#{@keysArray[0]}": params["#{@keysArray[0]}".to_sym])

    @keysArray.each_index{|x|
      if x > 0 && @valuesArray[x] != ""
        @users = @users.where("#{@keysArray[x]}": params["#{@keysArray[x]}".to_sym])
      end
    }   
  end

  # Created 11/12/2019 by Sri Ramya Dandu
  def new
    @user = User.new 
  end
  
  # Created 11/13/2019 by Sri Ramya Dandu
  def show
    @user = User.find(params[:id])
  end

  # Created 11/13/2019 by Sri Ramya Dandu
  def edit
    @user = User.find(params[:id])

  end

  # Created 11/13/2019 by Sri Ramya Dandu
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

  # Created 11/15/2019 by Sri Ramya Dandu
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :grad_year, :gender)
  end
end
