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
  	@game = Game.find(params[:id])
  	@file = File.new @game.pgn_file.to_s
  	@pgn_string = read_pgn_file @file
  	
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
  	
  	@positions = @game.positions
  	

  #	@engine = ChXBoardEngine.new "vendor/jazz/jazz-wb-444-32-ja.exe","vendor/jazz" 
  #	@engine.init
  #	@engine.send_message "setboard "+@positions.first.fen
  #	@engine.send_message "analyze"
  # @engine.quit
  	
  end

  def update
  end

end
