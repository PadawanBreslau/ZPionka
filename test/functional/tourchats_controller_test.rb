require 'test_helper'

class TourchatsControllerTest < ActionController::TestCase
	
def setup
  @tourchat1 = tournaments(:one)
  @tourchat2 = tournaments(:two)
  @controller  = TourchatsController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 	
	
  test "should get new" do
    get :new
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:tourchat)
    assert_equal assigns(:title), "Add new tourchat"
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_not_nil assigns(:tourchat)
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @tourchat1.id
    assert_not_nil assigns(:tourchat)
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tourchat1.id
    assert_response :success
  end
  
#  test "should get update" do
#  	get :update, :id => @tourchat1.id
#  	assert_not_nil assigns(:tournament)
#  	asser_equla flash[:success], "Tourchat destroyed."
#  	assert_response :redirect
#  end

end
