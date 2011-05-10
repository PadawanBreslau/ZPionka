require 'test_helper'

class TournamentsControllerTest < ActionController::TestCase
	def setup
  @tournament1 = tournaments(:one)
  @tournament2 = tournaments(:two)
  @controller  = TournamentsController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 
	
  test "should get new" do
    get :new
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "Add new tournament"
    assert_not_nil assigns(:tournament)
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_not_nil assigns(:tournament)
 #   assert_equal flash[:success], "Succesfull adding tournament"
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @tournament1.id
        
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "Edit tournament"
    assert_not_nil assigns(:tournament)
    assert_response :success
  end

  test "should get update" do
    get :update, :id => @tournament1.id
    assert_not_nil assigns(:tournament)
    assert_response :redirect
  end

  test "should get show" do
    get :show, :id => @tournament1.id
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "MyTournament"
    assert_not_nil assigns(:tournament)
    assert_not_nil assigns(:rounds)
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "Tournament list"
    assert_not_nil assigns(:tournaments)
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @tournament1.id
    assert_equal flash[:success] , "Tournament destroyed."
    assert_response :redirect
  end
  
  test "should get add_to_observed_and_redirect" do
  	get :add_to_observed_and_redirect
  	
  	assert_response :redirect
  end	
  

  


end
