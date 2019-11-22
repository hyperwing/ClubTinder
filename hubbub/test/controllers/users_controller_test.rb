# Edited 11/15/2019 by Sri Ramya Dandu 
# Edited 11/18/2019 by Sri Ramya Dandu 
# Edited 11/20/2019 by Sri Ramya Dandu 
# Edited 11/22/2019 by Sri Ramya Dandu 

require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    sign_in users(:admin)
  end

  test "redirected from index if not logged in" do
    sign_out :user
    get users_url
    assert_response :redirect
  end

  test "admin can access index" do
    sign_in users(:admin)
    get users_url
    assert_response :success
  end

  test "admin can access all user index" do
    sign_in users(:admin)
    get users_index_url
    assert_response :success
  end

  test "redirected stats if not logged in" do
    sign_out :user
    get users_stats_url
    assert_response :redirect
  end

  test "redirected new if not logged in" do
    sign_out :user
    get users_new_url
    assert_response :redirect
  end

  test "redirected display_stats if not logged in" do
    sign_out :user
    get users_display_stats_url
    assert_response :redirect
  end

  test "user can't access index" do
    sign_in users(:user)
    get users_url
    assert_response :redirect
  end

  test "user can't access all user index" do
    sign_in users(:user)
    get users_index_url
    assert_response :redirect
  end


  test "user can't access stats " do
    sign_in users(:user)
    get users_stats_url
    assert_response :redirect
  end

  test "user can't create new user" do
    sign_in users(:user)
    get users_new_url
    assert_response :redirect
  end

  test "user can't access display_stats" do
    sign_in users(:user)
    get users_display_stats_url
    assert_response :redirect
  end

  test "user can't create dummy user" do
    sign_in users(:user)
    get users_create_url
    assert_response :redirect
  end
  
  
  test "Should not save user without email" do
    user = User.new
    assert_not user.save, "Saved the user without an email"
  end
  
  test "should not save post without first and last name" do
    user = User.new(email:"sri@yahoo.com")
    assert_not user.save
  end


  test "should get stats" do
    get users_stats_url
    assert_response :success
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end

  test 'anyone can access explore' do
    sign_out :user
    get users_explore_url
    assert_response :success
  end

  test 'anyone can access sign in' do
    sign_out :user
    get  new_user_registration_url
    assert_response :success
  end

  test 'anyone can access sign up' do
    sign_out :user
    get users_sign_up_url
    assert_response :success
  end

  test "redirect admin to same page when params for input are not correct or incomplete" do
    get users_create_url
    assert_response :redirect
  end

  test 'signed in user can edit profile' do
    get edit_user_registration_url
    assert_response :success

    sign_in users(:user)
    get edit_user_registration_url
    assert_response :success
  end


  test 'signed in admin can edit preferences' do
    get users_preferences_url
    assert_response :success
  end

  test 'signed in user can edit preferences' do
    sign_in users(:user)
    get users_preferences_url
    assert_response :success
  end

  test 'admin can see their matched' do
    get '/users/matched/2'
    assert_response :success
  end

  test 'admin can see their unmatched' do
    get '/users/not_matched/2'
    assert_response :success
  end

  test 'user can see their matched' do
    sign_in users(:user)
    get '/users/matched/2'
    assert_response :success
  end

  test 'user can see their unmatched' do
    sign_in users(:user)
    get '/users/not_matched/2'
    assert_response :success
  end
end
