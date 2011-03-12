require 'test_helper'

class GamechatTest < ActiveSupport::TestCase

 gamechat = Gamechat.new(:comment => "It is a wonderfull day!")
 
 test "adding chat message to game works" do
 		assert_equal gamechat.comment, "It is a wonderfull day!"
 		assert_not_equal gamechat.comment, "it is a wonderfull day!"
 		assert_not_equal gamechat.comment, "It is a wonderfull day"
 	end


end
