require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

  test "Should not save user without email" do
    user = User.new
    assert_not user.save, "Saved the user without an email"
  end
  
  test "should not save post without first and last name" do
    post = User.new(email:"sri@yahoo.com")
    assert_not post.save
  end

  test "should get stats" do
    get users_stats_url
    assert_response :success
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end

end
