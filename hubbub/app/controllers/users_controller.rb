# File created 11/12/2019 by Sri Ramya Dandu 

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

  def parseByGender
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

end
