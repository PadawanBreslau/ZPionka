module PlayersHelper
	
def find_tournament_with_player(player,limit)
	@games_white = Game.find(  :all, :conditions => ["player1_id=?",player.id] , :limit => limit) 
	@games_black = Game.find(  :all, :conditions => ["player2_id=?",player.id] ,  :limit => limit)
	
	[@games_white,@games_black]	
end
	
end
