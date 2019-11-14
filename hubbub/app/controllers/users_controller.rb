# File created 11/12/2019 by Sri Ramya Dandu
# File edited 11/13/2019 by Sri Ramya Dandu: Added CRUD operations 
# File edited 11/13/2019 by Sri Ramya Dandu: Added stats displays 
class UsersController < ApplicationController
  
  include Devise::Controllers::Helpers 
  def index
    @user = current_user
    if @user.role == "admin"
      @title = "All Registered Users"
      @users = User.all
      @total = User.all.length
    end
  end

  def stats
    
  end

  def display_stats
    @keysArray = params.keys
    if(@keysArray[0] == "grad_year")
      @title = "Users graduating in" + params[:grad_year]
      @users = User.where(grad_year: params[:grad_year])
    elsif (@keysArray[0] == "gender")
      @title = "Users with gender: " + params[:gender]
      @users = User.where(gender: params[:gender])
    end 
  end

  def new
    @user = User.new 
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  def update
  end

  def destroy
  end
end
