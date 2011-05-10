require 'test_helper'

class TourplacesControllerTest < ActionController::TestCase
	
	def setup
		  
  @tourplace1 = tourplaces(:one)
  @tourplace2 = tourplaces(:two)
  @controller  = TourplacesController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 
	
  test "should get new" do
    get :new
       
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "Add new tourplace"
    assert_not_nil assigns(:tourplace)
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_not_nil assigns(:tourplace)
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tourplace1.id
    assert_response :success
  end

  test "should get update" do
    get :update, :id => @tourplace1.id
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @tourplace1.id
    assert_not_nil assigns(:tourplace)
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_not_nil assigns(:tourplace)
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "Tourplace list"
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @tourplace2.id
    assert_response :redirect
  end

end
