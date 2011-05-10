require 'test_helper'

class ZpawnControllerTest < ActionController::TestCase
	
def setup
  @zpawn1 = zpawns(:one)
  @zpawn2 = zpawns(:two)	
  @controller  = ZpawnsController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 
	
  test "should get new" do
    get :new
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:zpawn)
    assert_equal assigns(:title), "Add new zpawn"
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_not_nil assigns(:zpawn)
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @zpawn1.id
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:zpawn)
    assert_equal assigns(:title), "Edit zpawn"
    assert_response :success
  end

  test "should get update" do
    get :update, :id => @zpawn1.id
    assert_not_nil assigns(:zpawn)
   assert_response :success
  end

  test "should get index" do
    get :index
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:zpawn)
    assert_not_nil assigns(:zpawns)
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @zpawn2.id
    assert_equal flash[:success], "Zpawn destroyed."
    assert_response :redirect
  end

end
