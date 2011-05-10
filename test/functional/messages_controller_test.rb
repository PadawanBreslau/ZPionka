require 'test_helper'

class MessagesControllerTest < ActionController::TestCase
	
def setup
		  
  @message1 = messages(:one)
  @message2 = messages(:two)
  @controller  = MessagesController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 
	

  test "should get edit" do
    get :edit,  :id => @message1.id
        
    assert_not_nil assigns(:title) 
    assert_equal assigns(:title), "Edit message"
    assert_response :success
  end

  test "should get update" do
    get :update,  :id => @message1.id
    assert_response :success
  end

  test "should get destroy" do
    get :destroy,  :id => @message2.id
    assert_equal flash[:success], "message destroyed."
    assert_response :redirect
  end

end
