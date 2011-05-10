require 'test_helper'

class PlayersControllerTest < ActionController::TestCase
	
def setup
		  
  @player1 = players(:one)
  @player2 = players(:two)
  @controller  = PlayersController.new
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
    get :edit, :id => @player1.id
    assert_response :success
  end

  test "should get update" do
    get :update, :id => @player1.id
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @player1.id
        
    assert_not_nil assigns(:player)
    assert_not_nil assigns(:tournaments)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:games_white)
    assert_not_nil assigns(:games_black)
    
    assert_response :success
  end
  
  test "should get all games" do
  	get :list_all_games, :id => @player1.id
   
    assert_not_nil assigns(:player)
    assert_not_nil assigns(:tournaments)
    assert_not_nil assigns(:title)
    assert_not_nil assigns(:games_white)
    assert_not_nil assigns(:games_black)
    
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @player2.id
    assert_response :success
  end

end
