require 'test_helper'

class RoundsControllerTest < ActionController::TestCase
	
def setup
  @round1 = rounds(:one)
  @round2 = rounds(:two)
  @controller  = RoundsController.new
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

  test "should get update" do
    get :update, :id => @round1.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @round1.id
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @round1.id
        
    assert_not_nil assigns(:round)
    assert_not_nil assigns(:games)
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_not_nil assigns(:tournament)
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @round2.id
    assert_response :success
  end

end
