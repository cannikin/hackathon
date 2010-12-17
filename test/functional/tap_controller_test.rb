require 'test_helper'

class TapControllerTest < ActionController::TestCase
  test "should get go" do
    get :go
    assert_response :success
  end

end
