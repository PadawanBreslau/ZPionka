require "test_helper"


class CommentsControllerTest < ActionController::TestCase
	
def setup
		  
  @comment1 = comments(:one)
  @comment2 = comments(:two)
  @controller  = CommentsController.new
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
    get :edit, :id => @comment1.id
    assert_response :success
  end
  
    test "should get show" do
    get :show, :id => @comment1.id
    assert_response :success
  end

 ## test "should get update" do
  #  get :update, :id => @comment1.id
  # assert_response :success
 # end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @comment1.id
    assert_response :redirect
  end

end
