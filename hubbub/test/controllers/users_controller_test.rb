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

  test "redirect admin to same page when params for input are not correct or incomplete" do
    get users_create_url
    assert_response :redirect
  end
end
