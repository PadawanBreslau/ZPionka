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

  def show
  	@game = Game.find(params[:id])
  	@file = File.new @game.pgn_file.to_s
  	@pgn_string = ""
  	
  	 if File.file? @file 
  		 myfile = File.open @file.path, "r" do |f1|
  			 while line = f1.gets 
  			 	@pgn_string += line.to_s
			 end
		 end
  	 end 
  	
  	
  	unless @game.pgn_file.nil?
  		@game_pgn = PGNReader.new @game.pgn_file
  		@ggame = @game_pgn.parse_game
  		@round = @ggame.get_round
  		


  		
  	else	
  	
  	@game_pgn = PGNReader.new
  	@player_white = Player.find(@game.player1_id).surname
  	@player_black = Player.find(@game.player2_id).surname
  	
  	

  	end
  end

  def update
  end

end
