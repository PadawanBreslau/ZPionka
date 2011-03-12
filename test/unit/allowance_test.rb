require 'test_helper'

class AllowanceTest < ActiveSupport::TestCase

allowance = Allowance.new(:user_id => 1, :allowance_level =>3, :description => "Moderator")

  test "allowance saves data" do
  	assert_equal allowance.user_id, 1
  	assert_equal allowance.allowance_level, 3
  	assert_equal allowance.description, "Moderator"  	  	
  end
  
  
    
  
end
