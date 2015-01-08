require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get ventures" do
    get :ventures
    assert_response :success
  end

  test "should get connections" do
    get :connections
    assert_response :success
  end

end
