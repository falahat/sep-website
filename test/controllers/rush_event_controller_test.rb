require 'test_helper'

class RushEventControllerTest < ActionController::TestCase
  test "should get application" do
    get :application
    assert_response :success
  end

  test "should get events" do
    get :events
    assert_response :success
  end

end
