module GamesHelper
	
		
  def player(game,color)
  	if color == "white"
  		player = Player.find(game.player1_id)
  	else
  		player = Player.find(game.player2_id)
  	end	
  	 link_to (player.surname + " " + player.name), player
  end	
 
# Klasyczne tworzenie rundy   
def create_new_game round,id1,id2,result,date,pgn 
	game = Game.new
	game.round_id = round
	game.player1_id = id1
	game.player2_id = id2
	game.result = result
	game.round_date = date
	game.pgn_file = pgn

if Game.find(:first, :conditions => {:player1_id => game.player1_id, :player2_id => game.player2_id, :round_date => game.round_date}).nil?
    game.save!
end
end	

def create_new_game_without_pgn round,id1,id2,result,date 
	game = Game.new
	game.round_id = round
	game.player1_id = id1
	game.player2_id = id2
	game.result = result
	game.round_date = date
	game.pgn_file = ""
	
	game.round_date ||= Date.today
		
	possible_match = Game.find(:first, :conditions => {:player1_id => game.player1_id, :player2_id => game.player2_id, :round_date => game.round_date})
	
if possible_match.nil?
    game.save!
    
    pgn_string = "public/pgn/g_" + game.id.to_s + ".pgn"
    game.pgn_file = pgn_string
    game.save!
else
	possible_match
end
	

end	

# W przypadku braku wartosci round_id - odtwarzamy z bazy możliwe wartosci
def create_new_game id1,id2,result,date,pgn,round_flag 
	game = Game.new
	if round_flag == 1
		round_id = Round.last.id
	elsif round_flag == 2
		round_id = Tournament.rounds.last.id
	else
		round_id = 0
	end
	
	
	game.round_id = round_id
	game.player1_id = id1
	game.player2_id = id2
	game.result = result
	game.round_date = date
	game.pgn_file = pgn

if Game.find(:first, :conditions => {:player1_id => game.player1_id, :player2_id => game.player2_id, :round_date => game.round_date}).nil?
    game.save!
end
end	

# Gdy partia nie ma daty
def create_new_game round,id1,id2,result,pgn
	game = Game.new
	round_date = Round.find(round).round_date
	
	game.round_id = round
	game.player1_id = id1
	game.player2_id = id2
    game.result = result
	game.round_date = round_date
	game.pgn_file = pgn
	
	round_date ||= Date.today
	
if Game.find(:first, :conditions => {:player1_id => game.player1_id, :player2_id => game.player2_id}).nil?
    game.save!
end
end	

# Gdy mamy tylko podstawowe dane
def create_new_game round,id1,id2
	game = Game.new

	game.round_id = round
	game.player1_id = id1
	game.player2_id = id2
	
if Game.find(:first, :conditions => {:player1_id => game.player1_id, :player2_id => game.player2_id}).nil?
    game.save!
end
end

def create_new_game id1,id2
	game = Game.new
	round_id = Round.last.id
	round_id ||= 0

	game.round_id = round_id
	game.player1_id = id1
	game.player2_id = id2
	
	if Game.find(:first, :conditions => {:player1_id => game.player1_id, :player2_id => game.player2_id}).nil?
    game.save!
end
end

end
