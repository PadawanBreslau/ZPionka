require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  
	message = Message.new(:user1_id => 1, :user2_id =>2, :title => "You try", :message => "You rock")
	
	test "creating message" do
	assert_not_nil message.user1_id
	assert_not_nil message.user2_id
	assert_not_nil message.title
	assert_not_nil message.message
	
	assert_equal message.title , "You try"
	assert_equal message.message , "You rock"
		
	end	
	

end
