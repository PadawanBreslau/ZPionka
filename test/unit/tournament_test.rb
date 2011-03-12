require 'test_helper'

class TournamentTest < ActiveSupport::TestCase
 fixtures :tournaments
 
 test "creating tournaments" do
 	assert_not_nil tournaments("one").place
 	assert_not_nil tournaments("one").start_date
 	assert_not_nil tournaments("one").finish_date
 	assert_equal tournaments("one").rounds, 1
 end
 	
end
