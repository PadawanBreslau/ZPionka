module TournamentsHelper
	
  def tournament_results (round_number)
  	@rounds = @tournament.rounds
  	unless 	@rounds.first.nil?
  		@games = @rounds.first.games
		players = all_players(@games)
	
		@games = @tournament.games
	else
		return
	end
	
	@games.each do |game|
		player1 = game.player1_id
		player2 = game.player2_id
		result = game.result
		
		unless result.nil?
			
			if result == "1"
				
				players = find_player_with_id(player1, players,1)
				players = find_player_with_id(player2, players,0)
			elsif result == "2"
				
				players = find_player_with_id(player1, players,0.5)
				players = find_player_with_id(player2, players,0.5)
				
			elsif result == "3"	
			
				players = find_player_with_id(player1, players,0)
				players = find_player_with_id(player2, players,1)	
		    end
    	
		end    	
		
	end	
		
 	players.sort_by{|a| -a[1]}
  	
  end	
  
  def find_player_with_id(player1, players, add)
  	players.each do |p|
		if p[0] == player1
			p[1] += add 		
  		end
  	end
  end	
  
  def all_players(games)
  	players = Array.new
  	games.each do |game|
  		p1 = [Player.find(game.player1_id).id,0]
  		p2 = [Player.find(game.player2_id).id,0]
  		
  		players.insert(0,p1)
  		players.insert(0,p2)
  	end	
  	players
  end	
	
def	tournament_not_observed(id)
	Observedtournament.find_by_tournament_id(id).nil?
end

 def  get_all_rounds(id)
 	 Round.find_all_by_tournament_id(id)
 end
 
 def get_all_games(tournament_id,user_id)
 	
 	if user_id == 0
 		rounds_info = cookies.signed[:watched_round]
		return Game.find_all_by_round_id(rounds_info)
	else
 		@observation = Observedround.where(:user_id => user_id, :tournament_id => tournament_id).first
 	end
 	
 	unless @observation.nil?
 		Game.find_all_by_round_id(@observation.round_id)
 	end
 end

def prepare_game_string(game)
	player1 = Player.find(game.player1_id)
	player2 = Player.find(game.player2_id)
	
	names_string = player1.surname + "," + player1.name + " - " + player2.surname + "," + player2.name
	
	unless game.result.nil?
		names_string += ",  " + make_result(game.result) 
	end	
	
	names_string
end

def already_observed(game)
	!Observe.where(:user_id => current_user.id, :game_id => game.id).first.nil?
end	
	

private

def make_result(result)
	if result == "1"
		"1-0"
	elsif result == "2"
		"1/2"
	elsif result == "3" 
		"0-1"
	else 
		"Unknown"
	end
end	

end
