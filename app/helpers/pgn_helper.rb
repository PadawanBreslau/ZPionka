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
  
  
  # If player wasn't in DB creating a new one
   def create_new_player color,game
   p = Player.new
   
   	if color == 0
   		name = game.white.split(" ")[0]
   		surname = game.white.split(" ")[1]
   		rating = game.white_elo
   			
   	elsif color == 1
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
  
   
def insert_PGN_tournament_file_into_database file
   	pgn_reader = PGNReader.new file
   	tournament = Tournament.new
   	
   	game = pgn_reader.parse_game
   	tournament.place = game.event
    tournament.name = game.site
    tournament_start = game.date
   	tournament_finish = game.date
   	round_number = game.round
   	round_id = 0
   	
   	pgn_reader = PGNReader.new file
   	while game = pgn_reader.parse_game do
   		
   		if game.date < tournament_start
   			tournament_start = game.date
   		elsif game.date > tournament_finish
   			tournament_finish = game.date
   		end
   		
   		if game.round > round_number
   			round_number = game.round
   		end	
   			
   		round = create_round(game, nil, Tournament.last.id + 1)
		unless (round).nil?
			round_id = round.id
		end	
		
		insert_game_file_into_database(game,round_id)
   		
	 end
	 
	 tournament.start_date = tournament_start
	 tournament.finish_date = tournament_finish
	 
	 if Tournament.find(:first, :conditions => {:name => tournament.name, :site => tournament.site}).nil?
	 tournament.save!
    end
end
   
   def create_game(game, round_id)
   	g = Game.new
    		player1 = Player.find_by_surname(game.white.split(" ")[1])
    		player2 = Player.find_by_surname(game.black.split(" ")[1])
    		result = game.get_result
    		date = game.get_date
    		
    		if player1.nil?
    			player1 = create_new_player(0,game)
    		end
    		if player2.nil?
    			player2 = create_new_player(1,game)
    		end
    		
    		
    		g.player1_id = player1.id
    		g.player2_id = player2.id
    		g.result = result
    		g.round_date = date
    		g.round_id = round_id
    		
    		
    		if Game.find(:first, :conditions => {:player1_id => g.player1_id, :player2_id => g.player2_id, :round_date => date}).nil?
    			g.save	
    		end
   end	
   
   
   def create_round(game,file,tournament_id)
   	    r = Round.new
    	r.round_number = game.round.to_i  	
    	r.tournament_id = tournament_id
    	r.round_date = game.date
    	r.pgn_file = file
    			
    			if Round.find(:first, :conditions => {:tournament_id => r.tournament_id, :round_number => r.round_number}).nil?
    				r.save
    			end
   	
   	
   end
   
   #Inserting into database new round
    def insert_PGN_round_file_into_database file, tournament_id
    	pgn_reader = PGNReader.new file
    	  
    	while game = pgn_reader.parse_game do
    		r_last = Round.last
		
    		#Jesli ostatnio wpisana runda miala inny numer niz obecna
    		if game.round != r_last.round_number.to_s			
    			create_round(game,file,tournament_id)    	  			
    			round_id = Round.last.id
    		else
    			round_id = r_last.id
    		end	
    		 
    		 insert_game_file_into_database(game, round_id)
    		
    		
    		
		end
    end	
    
    
    
    def insert_PGN_game_file_into_database file, id
		 	
		pgn_reader = PGNReader.new file
  		game = pgn_reader.parse_game
  		
  		insert_game_file_into_database game, id 	
  	end
    
  	
  	
	#Inserting into database new game
	def insert_game_file_into_database game, id
		 	
		#pgn_reader = PGNReader.new file
  		#game = pgn_reader.parse_game
  		
  		game.goto_start
	    move_number = 1.0
	    
	    saved_game = create_game(game,id)
	
		while game.has_next_move && !saved_game.nil? do
					
			position = game.get_position
			move = game.get_next_move
		
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
  			pos.game_id = saved_game.id
  			
  			pos.save!
  			game.go_forward
  			move_number += 0.5
  			
		end
	end	
end
