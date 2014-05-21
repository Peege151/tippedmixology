require 'test_helper'

class PagesControllerTest < ActionController::TestCase
    include Devise::TestHelpers

  test "should get home" do
    get :home
    assert_response :success
  end

  test "should get news" do
    get :news
    assert_response :success
  end


end
