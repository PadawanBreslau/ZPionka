class GamesController < ApplicationController
  def new
  end


  def create
  end

  def edit
  end

  def destroy
  end

  def index
  end
  
  def read_pgn_file file
  	@pgn_string = ""
  	 if File.file? file 
  	 myfile = File.open file.path, "r" do |f1|
  		while line = f1.gets 
  			 @pgn_string += line.to_s
		end
	end
	@pgn_string
  end 
  		
  end

  def show
  	if Game.find(params[:id])!=nil?
  		@game = Game.find(params[:id])
  		@file = File.new @game.pgn_file.to_s
  		@pgn_string = read_pgn_file @file
  		
  		
  		
  		@nextgame = Game.find(@game.id+1) rescue @game
  		@prevgame = Game.find(@game.id-1) rescue @game
  		
  		if @nextgame==@game || @nextgame.round!=@game.round
  			@nextroundgame = @nextgame
  			@nextgame=@game
  		end
  		
  		if @prevgame==@game || @prevgame.round!=@game.round
  			@prevroundgame = @prevgame
  			@prevgame=@game
  		end
  			

  		
  	
  		@game_pgn = PGNReader.new @game.pgn_file
  		@ggame = @game_pgn.parse_game
	
  		unless @game.pgn_file.nil?
  			@game_pgn = PGNReader.new @game.pgn_file
  			@ggame = @game_pgn.parse_game
  			@round = @ggame.get_round
  		  	@player_white = Player.find(@game.player1_id)
  			@player_black = Player.find(@game.player2_id)
  	
  		else	
  		
 	 		@game_pgn = PGNReader.new
 	 		@player_white = Player.find(@game.player1_id)
 	 		@player_black = Player.find(@game.player2_id)#.surname
  	  	
  		end
  		
	end
	
	@positions = @game.positions
	
	cookies['position_start'] = @game.positions.first.id
    cookies['position_last'] =  @game.positions.last.id
	
	 unless cookies['position'].nil? 	
		cookies.delete 'position'	
	 end 

    
    cookies['position'] = cookies['position_start']
    
    
   
    
    
 	
    #@position = @positions.first.id
  	
  	
 	#cookies[:position] = @position
  	
  	

  #	@engine = ChXBoardEngine.new "vendor/jazz/jazz-wb-444-32-ja.exe","vendor/jazz" 
  #	@engine.init
  #	@engine.send_message "setboard "+@positions.first.fen
  #	@engine.send_message "analyze"
  # @engine.quit
  	
  end
  
  def show_games_in_java_window
  	#
  	@observes = Observe.find_all_by_user_id(current_user)
  	
  	@game1 = Game.find(@observes[0].game_id)
  	@game_pgn = PGNReader.new @game1.pgn_file
  	@parsed_game = @game_pgn.parse_game
  	@browser1 = GameBrowser.new @parsed_game
  	
  	@game2 = Game.find(@observes[1].game_id)
  	@game_pgn = PGNReader.new @game2.pgn_file
  	@parsed_game = @game_pgn.parse_game
  	@browser2 = GameBrowser.new @parsed_game
  	
  	@game3 = Game.find(@observes[2].game_id)
  	@game_pgn = PGNReader.new @game3.pgn_file
  	@parsed_game = @game_pgn.parse_game
  	@browser3 = GameBrowser.new @parsed_game
  	
  	@game4 = Game.find(@observes[3].game_id)
  	@game_pgn = PGNReader.new @game4.pgn_file
  	@parsed_game = @game_pgn.parse_game
  	@browser4 = GameBrowser.new @parsed_game
  	
  	@frame = JFrame.new "Window to display games"
  	@frame.set_visible true
  	@frame.set_location 50, 50
  	@frame.set_size 1080, 720
  	
  	@panel1 = JPanel.new
  	@panel1.add @browser1
  	@panel1.set_size 540, 360
	@panel1.set_visible true
  	
	@panel2 = JPanel.new
  	@panel2.add @browser2
  	@panel2.set_size 540, 360
  	@panel2.set_visible true
  	
  	@panel3 = JPanel.new
  	@panel3.add @browser3
  	@panel3.set_size 540, 360
  	@panel3.set_visible true
  	
  	@panel4 = JPanel.new
  	@panel4.add @browser4
  	@panel4.set_size 540, 360
  	@panel4.set_visible true
  	
  	@frame.set_layout GridLayout.new 2,2
  	
  	@frame.add @panel1
  	@frame.add @panel2
  	@frame.add @panel3
  	@frame.add @panel4
  	
  		
  	redirect_to_back root_path
  end	

  def update
  end

end
