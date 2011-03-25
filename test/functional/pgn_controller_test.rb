require 'test_helper'

class PgnControllerTest < ActionController::TestCase
  test "should get add_pgn" do
    get :add_pgn
    assert_response :success
  end

end
