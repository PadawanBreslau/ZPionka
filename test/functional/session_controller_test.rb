require 'test_helper'

class SessionControllerTest < ActionController::TestCase
	
def setup
  @controller  = SessionsController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 

  test "should get new" do
    get :new
    assert_response :success
  end

end
