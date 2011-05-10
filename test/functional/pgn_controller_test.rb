require 'test_helper'

class PgnControllerTest < ActionController::TestCase
  test "should get add_pgn" do
    get :add_pgn
        
    assert_not_nil assigns(:pgn)
    assert_not_nil assigns(:upload)
    assert_response :success
  end

end
