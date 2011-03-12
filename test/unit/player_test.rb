require 'test_helper'

class PlayerTest < ActiveSupport::TestCase
  
	player1 = Player.new(:id =>1, :name => "Garri", :surname => "Kasparov", :rating => 2851, :country => "RUS" )
	player2 = Player.new(:id =>2,:name => "Garri", :surname => "Kasparov", :rating => 2851, :country => "RUS" )
	player3 = Player.new(:id =>3,:name => "Anatoli", :surname => "Karpov", :rating => 2651, :country => "RUS" )
	
	test "player data are correctly saved" do
		
		assert_equal player1.name, "Garri"
		assert_equal player1.surname, "Kasparov"
		assert_equal player1.rating, 2851
		assert_equal player1.country, "RUS"
		assert_not_equal player1.rating, "2851"
		
	end	
	
	test "player merging" do
		assert_equal player1.merge_players(player1,player2), "Players matched - one was replaced"	
		assert_equal player1.merge_players(player1,player3), "Players don't match"
		assert_equal player1.merge_players(player2,player3), "Players don't match"
		
	end	
	
	test "changing game owners" do
		game1 = Game.new(:player1_id => player1.id, :player2_id => player3.id)
		game2 = Game.new(:player1_id => player1.id, :player2_id => player3.id)
		game3 = Game.new(:player1_id => player2.id, :player2_id => player3.id)
		
		player1.merge_players(player1, player2)
		
		assert_equal game3.player1_id ,game1.player1_id 
		#assert_nil player2
		
	end	

end
