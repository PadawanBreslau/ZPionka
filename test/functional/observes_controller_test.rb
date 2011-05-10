require 'test_helper'

class ObservesControllerTest < ActionController::TestCase
def setup
		  
  @observe1 = observes(:one)
  @observe2 = observes(:two)
  @controller  = ObservesController.new
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

  test "should get destroy" do
    get :destroy, :id => @observe1.id
    assert_response :success
  end

  test "should get show" do
    get :show, :id => @observe1.id
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
