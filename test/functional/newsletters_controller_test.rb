require 'test_helper'

class NewslettersControllerTest < ActionController::TestCase
	
def setup
		  
  @letter1 = newsletters(:one)
  @letter2 = newsletters(:two)
  @controller  = NewslettersController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 
	
  test "should get new" do
    get :new
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "New newsletter"
    assert_not_nil assigns(:newsletter)
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @letter1.id
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "Edit newsletter"
    assert_not_nil assigns(:newsletter)
    assert_response :success
  end

  test "should get update" do
    get :update, :id => @letter1.id
    assert_not_nil assigns(:newsletter)
    assert_equal flash[:success] , "Newsletter succesfully updated."
    assert_response :redirect
  end

  test "should get show" do
    get :show, :id => @letter1.id
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "MyString"
    assert_not_nil assigns(:newsletter)
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get send" do
    get :send
    assert_response :success
  end

end
