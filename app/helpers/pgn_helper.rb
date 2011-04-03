module PgnHelper
	
	include Java 	
  require  'lib\chesspresso-lib'
  include_class 'chesspresso.pgn.PGNReader'
  include_class 'chesspresso.position.FEN'
  include_class ('chesspresso.game.Game') {|package,name| "J" + name}
  include_class 'chesspresso.game.view.GameBrowser'
  include_class 'javax.swing.JButton'
  include_class 'javax.swing.JPanel'
  include_class 'javax.swing.JFrame'
  
   def create_new_player color,game
   p = Player.new
   
   	if color == 0
   		name = game.white.split(" ")[0]
   		surname = game.white.split(" ")[1]
   		rating = game.white_elo
   			
   	elsif color = 1
   		name = game.black.split(" ")[0]
   		surname = game.black.split(" ")[1]
   		rating = game.black_elo
   		
   	else
   	
   	end
   	
   	p.name = name
   	p.surname = surname
   	p.rating = rating
   	
   	p.save!
   				 	
   		
   end	
  
    def insert_PGN_round_file_into_database file
    	pgn_reader = PGNReader.new file
    	game_id = Game.last.id 
    	
    	
    	while game = pgn_reader.parse_game do
    		
    		game_id += 1
    		g = Game.new
    		player1 = Player.find_by_surname(game.white.split(" ")[1])
    		player2 = Player.find_by_surname(game.black.split(" ")[1])
    		
    		if player1.nil?
    			create_new_player(0,game)
    		end
    		
    		if player2.nil?
    			create_new_player(1,game)
    		end
    			
  			
		end
    end	
	
	def insert_PGN_game_file_into_database file, id
		 	
		pgn_reader = PGNReader.new file
  		@game = pgn_reader.parse_game
  		
  		@game.goto_start
	    move_number = 1.0
	
		while @game.has_next_move do
					
			position = @game.get_position
			move = @game.get_next_move
		
			fen = FEN.get_fen(position)
  			move_string = move.to_string
  			
  			if move_number == move_number.floor
  				white_move = true
  			else
  				white_move = false
  			end
  								
  			pos = Position.new
  			pos.fen = fen
  			pos.move = move_string
  			pos.white_on_move = white_move
  			pos.move_number = move_number.floor
  			pos.game_id = id
  			
  			pos.save!
  			@game.go_forward
  			move_number += 0.5
  			
		end
	end	
end
