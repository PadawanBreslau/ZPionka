require 'test_helper'

class GameTest < ActiveSupport::TestCase
	fixtures :games
	
	test "game creating" do
		assert_not_nil games("one").player1_id
		assert_not_nil games("one").player2_id
		assert_not_nil games("one").result
		assert_not_nil games("one").round_date
	end	


end
