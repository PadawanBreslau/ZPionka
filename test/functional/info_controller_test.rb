require 'test_helper'

class InfoControllerTest < ActionController::TestCase
	
def setup
		  
  @info1 = infos(:one)
  @info2 = infos(:two)
  @controller  = InfosController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 	

test "should get new bad info" do
    get :new, :id => @info1.id
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "New info"
    assert_not_nil assigns(:info)
    assert_response :success    
  end
	
  test "should get show" do
    get :show, :id => @info1.id
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "MyString"
    assert_not_nil assigns(:info)
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "Info list"
    assert_not_nil assigns(:info)
    assert_response :success
  end

  test "should get update" do
    get :update, :id => @info2.id
    assert_not_nil assigns(:info)
    assert_response :redirect
  end

  test "should get destroy" do
    get :destroy, :id => @info2.id
    assert_equal flash[:success] , "Info destroyed."
    assert_response :redirect
  end

  test "should get edit" do
    get :edit, :id => @info1.id
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "Edit info"
    assert_not_nil assigns(:info)
    
    assert_response :success
  end

end
