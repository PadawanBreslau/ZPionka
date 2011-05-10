require 'test_helper'

class PositionsControllerTest < ActionController::TestCase
	
def setup
  @position1 = positions(:one)
  @position2 = positions(:two)
  @controller  = PositionsController.new
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
    get :edit, :id => @position1.id
    assert_response :success
  end

  test "should get update" do
    get :update, :id => @position1.id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @position1.id
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @position1.id
    assert_response :success
  end

end
