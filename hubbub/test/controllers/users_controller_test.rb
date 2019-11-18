require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest





  test "should get stats" do
    get users_stats_url
    assert_response :success
  end

  test "should get new" do
    get users_new_url
    assert_response :success
  end



end
