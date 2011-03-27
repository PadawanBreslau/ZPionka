module GamesHelper
	
  def player(game,color)
  	if color == "white"
  		player = Player.find(game.player1_id)
  	else
  		player = Player.find(game.player2_id)
  	end	
  	 link_to (player.surname + " " + player.name), player
  end	
  
end
