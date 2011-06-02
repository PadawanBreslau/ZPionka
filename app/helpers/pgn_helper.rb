module PgnHelper
	
	include Java 	
  require  'lib\chesspresso-lib'
  include_class 'chesspresso.pgn.PGNReader'
  include_class 'chesspresso.pgn.PGNWriter'
  include_class 'java.io.PrintWriter'
  include_class 'chesspresso.position.FEN'
  include_class ('chesspresso.game.Game') {|package,name| "J" + name}
  include_class ('java.io.File') {|package,name| "J" + name}
  include_class 'chesspresso.game.view.GameBrowser'
  include_class 'chesspresso.engines.ChXBoardEngine'
  include_class 'javax.swing.JButton'
  include_class 'javax.swing.JPanel'
  include_class 'javax.swing.JFrame'

def insert_PGN_tournament_file_into_database file
   	pgn_reader = PGNReader.new file
   	tournament = Tournament.new
   	
   while game = pgn_reader.parse_game do
    name = game.event
    place = game.site
    unless game.date == ""
    	date = Date.parse game.date  
    end
    date ||= Date.today
    round_number = game.round

    create_new_tournament name, place, date
    this_tournament_id = Tournament.find_by_name(name).id
    
    change_tournament_finish this_tournament_id,date
    change_tournament_start this_tournament_id,date

	create_new_round this_tournament_id, date, round_number
		
	round_id = Round.find(:first, :conditions => {:tournament_id => this_tournament_id, :round_number => round_number}).id
	
    last_round = Round.find_by_tournament_id(this_tournament_id)
	round_id ||= last_round.id
	
	insert_game_file_into_database game,round_id
   end

end

def insert_game_file_into_database game, id		 	
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
  			
  		
  	@engine = ChXBoardEngine.new "vendor/jazz/jazz-wb-444-32-ja.exe","vendor/jazz" 
  	@engine.init
  	@engine.send_message "xboard"
  	#@engine.send_message "depth 10"
  	@engine.send_message "setboard " + fen
  	@engine.send_message "post"
  	@engine.send_message "analyze"
  	@quality = 3
  		#[1..@quality].each do	
  			@myresult1 = @engine.wait_for_answer 1000,6
  	  		@myresult2 = @engine.wait_for_answer 1000,6
  	  		@myresult3 = @engine.wait_for_answer 1000,6
  	  		@myresult1 = @engine.wait_for_answer 1000,6
  	  		@myresult2 = @engine.wait_for_answer 1000,6
  	  		@myresult3 = @engine.wait_for_answer 1000,6
  		 #end
  		 
  		 @myresult1 = parse_engine_output @myresult1,3, move_number.floor, white_move
  		 @myresult2 = parse_engine_output @myresult2,2, move_number.floor, white_move
  		 @myresult3 = parse_engine_output @myresult3,1, move_number.floor, white_move



    @engine.quit
  			
  			

  								
  			pos = Position.new
  			pos.var1 = @myresult3
  			pos.var2 = @myresult2
  			pos.var3 = @myresult1
  			
  			pos.fen = fen
  			pos.move = move_string
  			pos.white_on_move = white_move
  			pos.move_number = move_number.floor
  			pos.game_id = saved_game.id
  			
  			pos.save!
  			game.go_forward
  			move_number += 0.5
  			
		end
		
		#@engine.quit
end


def parse_engine_output output, number, move_number, white_move
	
	output_table = output.split ' '
	
	if white_move
		new_output = ""
	else
		new_output = move_number.to_s + "."
		move_number+=1
	end
	
		
	for i in 4..output_table.size do 
		if white_move && i%2 == 0 || !white_move && i%2 == 1
			new_output = new_output + " " + move_number.to_s + "." + output_table[i].to_s + " " 
			move_number+=1
		else			
			new_output = new_output + output_table[i].to_s + " "
		end	
		
	end
	
	new_output + "Eval: " + ((output_table[1].to_f)/100).to_s
end 	


def create_game game, round_id
   
    		player1 = Player.find_by_surname(game.white.split(" ")[1])
    		player2 = Player.find_by_surname(game.black.split(" ")[1])
    		result = game.get_result
    		
    		date = Date.parse game.get_date
    		date ||= Date.today

    		player1 ||= create_new_player(0,game)
    	    player2 ||= create_new_player(1,game)
    		
    		logger.info "player1" + player1.id.to_s
    		logger.info "player2" + player2.id.to_s
    		
    		
    			    
    		saved_game = create_new_game_without_pgn(round_id, player1.id ,player2.id, result, date)
    		
    		logger.info Game.last.pgn_file.to_s
    		
    		  
    		file = JFile.new(Game.last.pgn_file.to_s)
    		file.set_writable true
    		print_writer = PrintWriter.new file
    		pgn_writer = PGNWriter.new print_writer
    		pgn_writer.write(game.getModel)
    		print_writer.flush
    		
    		
    		
    		
    		Game.last
end
   

def create_new_player color,game
    p = Player.new
   
   	if color == 0
   		surname = game.white.split(",")[0].delete(' ')
   		name = game.white.split(",")[1].delete(' ')
   		rating = game.white_elo
   	elsif color == 1
   		surname = game.black.split(",")[0].delete(' ')
   		name = game.black.split(",")[1].delete(' ')
   		rating = game.black_elo	   	
   	end  	
   	
   	p.name = name
   	p.surname = surname
   	p.rating = rating  	
   	possible_match = Player.find(:first, :conditions => {:name => p.name, :surname => p.surname})
   	
   	if possible_match.nil?
   		p.save!	
   		logger.info "new id" + p.id.to_s
   	end
   	
    Player.find(:first, :conditions => {:name => p.name, :surname => p.surname})	
 end		


end