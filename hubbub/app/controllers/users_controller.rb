# File created 11/12/2019 by Sri Ramya Dandu
# File edited 11/13/2019 by Sri Ramya Dandu: Added CRUD operations 
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
    @title = "Females"
    @users = User.where(gender: "female")
  end

  def parseByGraduation 
    @title = "Users graduating in "
    @users = User.where(grad_year: "2019")
  end

  def new
    @user = User.new 
  end
  
  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
