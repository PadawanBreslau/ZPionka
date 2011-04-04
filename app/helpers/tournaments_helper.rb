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
	
	players = count_bucholtz(players)
	players = count_avg_rating(players)
		
 	players.sort_by{|a| -a[1]}
  	
  end	
  
  def count_bucholtz(players)
  	players.each do |player|
	  	player_bucholtz = 0
	  	max_bucholtz = 0
	  	min_bucholtz = 0
	  	
  		@opponents = find_player_opponents(player[0])
  		
  		@opponents.each do |opponent|
  			players.each do |player2|
  				if player2[0] == opponent
  					add_bucholtz = player2[1]
					player_bucholtz += add_bucholtz
					
					if min_bucholtz ==0
						min_bucholtz = max_bucholtz = add_bucholtz
					elsif  add_bucholtz < min_bucholtz
						min_bucholtz = add_bucholtz
					elsif  add_bucholtz > max_bucholtz
						max_bucholtz = add_bucholtz
					end				
  				end	
  			end
  		end	
	  	
	  	player[2] = player_bucholtz
	  	player[3] = player_bucholtz - (max_bucholtz+min_bucholtz)
  	end	
  	
  	players
  end	
  
  def count_avg_rating(players)
  	 players.each do |player|
  	  	
	  	@opponents = find_player_opponents(player[0])
	  	rounds = @opponents.size
	  	@opponents.each do |opponent|
	  		@rating_sum = 0
	  		rating = Player.find(opponent).rating
	  		@rating_sum += rating
        end
        player[4] = @rating_sum/rounds
  	end
  	players
  end	
  
  def find_player_opponents(player_id)
  	@games = @tournament.games
  	opponents = Array.new
  	
  	@games.each do |game|
  		if game.player1_id == player_id  
  			opponents.insert(0,game.player2_id)
  		elsif game.player2_id == player_id
  			opponents.insert(0,game.player1_id)
  		end	
  	end	
  	opponents
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
  		p1 = [Player.find(game.player1_id).id,0,0]
  		p2 = [Player.find(game.player2_id).id,0,0]
  		
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

def make_result(result)
	if result == "1"
		"1-0"
	elsif result == "2"
		"1/2"
	elsif result == "3" 
		"0-1"
	else 
		" - "
	end
end	

end
