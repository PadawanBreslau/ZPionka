require 'test_helper'

class AllowancesControllerTest < ActionController::TestCase

def setup	
  @controller  = AllowancesController.new
  @request     = ActionController::TestRequest.new
  @response    = ActionController::TestResponse.new
end 
	
  test "should get new" do
    get :new
    assert_response :success
    assert_not_nil assigns(:title)
    assert_equal assigns(:title), "Giving permisions"
  end

  test "should get create" do
    get :create
    assert_not_nil (:allowance)
    assert_equal flash[:success], "Udane dodanie"
    assert_redirected_to user_list_path
  end

end
