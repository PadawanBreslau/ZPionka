require 'test_helper'

class PositionTest < ActiveSupport::TestCase
 fixtures :positions
 
 test "position creating" do
 	assert_not_nil positions("one").move 
 	assert_not_nil positions("one").var1  
 	assert_not_nil positions("one").var2 
 	assert_not_nil positions("one").move_eval
 	assert_not_nil positions("one").move_number
	assert_not_nil positions("one").white_on_move  
 	
 	end
end
