class Player < ActiveRecord::Base
	validates :name, :presence => true
	validates :surname, :presence => true
	validates :rating, :numericality => true
	
	has_many :games
	has_many :tourplaces
	
	def merge_players(player1, player2)
		if compare_players(player1, player2)
			compared_players = player_with_more_games(player1, player2)
			@games_with_white = Game.find_all_by_player1_id(compared_players[1])
			@games_with_black = Game.find_all_by_player1_id(compared_players[1])
			
			@games_with_white.each do |game|
				game.player1_id = compared_players[0].id
				game.save
			end	
			
			@games_with_black.each do |game|
				game.player2_id = compared_players[0].id
				game.save
			end	
			
			Player.delete(compared_players[1].id)
			
			"Players matched - one was replaced"
		else 
			"Players don't match"	
		end	
		
		
	end	
	
	
	private
	def compare_players(player1, player2)
		player1.name == player2.name && player1.surname == player2.surname 
	end
	
	def player_with_more_games(player1, player2)
		if Game.find_all_by_player1_id(player1.id).size + Game.find_all_by_player2_id(player1.id).size >= Game.find_all_by_player1_id(player2.id).size + Game.find_all_by_player2_id(player2.id).size
			[player1,player2]
		else
			[player2,player1]
		end
	end
		 
end
