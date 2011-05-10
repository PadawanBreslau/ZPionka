require 'test_helper'

class GamesControllerTest < ActionController::TestCase
def setup
		  
  @game1 = games(:one)
  @game2 = games(:two)
  @controller  = GamesController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 	
	
#  test "reads_wrong_pgn_file" do
#  	get :read_pgn_file
#  	assert_not_nil assigns(:pgn_string)
# 	assert_equal assigns(:pgn_string), ""
#  	assert_response :success
#  end
  
 # test "reads_good_pgn_file" do
 # 	get :read_pgn_file,  { 'file' => "pgn/mecz.pgn" }
 # 	assert_not_nil assigns(:pgn_string)
 # 	assert_not_equal assigns(:pgn_string), ""
 # 	assert_response :success
 # end
 
# test "should get show" do
# 	get :show, :id => @game1.id
# 	assert_not_nil assigns(:game) 
#	assert_not_nil assigns(:file) 
#	assert_not_nil assigns(:pgn_string)
#	assert_equal assigns(:pgn_string) , "pgn/partie.pgn"	
# end
 	
  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get create" do
    get :create
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @game1.id
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, :id => @game2.id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end


  test "should get update" do
    get :update, :id => @game1.id
    assert_response :success
  end

end
