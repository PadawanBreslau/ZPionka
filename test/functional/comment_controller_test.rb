require "test_helper"


class CommentControllerTest < ActionController::TestCase
  
test "shoold create a comment" do
	  assert_difference('Comment.count') do
    	comment :create, :comment => { :title => 'Some title'}
  	end
 
  assert_redirected_to Info.find(@comment.info_id)
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
    get :update
    assert_response :success
  end

  test "should get edit" do
    get :edit
    assert_response :success
  end

  test "should get show" do
    get :show
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get destroy" do
    get :destroy
    assert_response :success
  end

end
