require 'test_helper'

class GamechatsControllerTest < ActionController::TestCase
	
def setup
		  
  @chat1 = gamechats(:one)
  @chat2 = gamechats(:two)
  @controller  = GamechatsController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 	

	
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @chat1.id
    assert_response :success
  end

  test "should get update" do
    get :update, :id => @chat1.id
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @chat1.id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @chat2.id
    assert_response :success
  end

end
