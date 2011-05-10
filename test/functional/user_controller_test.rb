require 'test_helper'

class UserControllerTest < ActionController::TestCase
	
def setup
  @user1 = users(:one)
  @user2 = users(:two)
  @controller  = UsersController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 
	
  test "should get new" do
    get :new
        
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:user)
    assert_equal assigns(:title), "New User"
    assert_response :success
  end
  
  test "should get index" do
  	get :index
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:user)
    assert_equal assigns(:title), "User list"
  end	

  test "should get create" do
    get :create
    assert_not_nil assigns(:user)
    assert_equal assigns(:title), "Rejestracja"
    assert_response :success
  end

  test "should get update" do
    get :update, :id => @user1.id
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @user1.id
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:user)
    assert_equal assigns(:title), "Edit user"
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @user1.id
    assert_equal flash[:success] , "User destroyed."
    assert_response :redirect
  end

end
