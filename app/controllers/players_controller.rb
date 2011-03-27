class PlayersController < ApplicationController
  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def show
  	@player = Player.find(params[:id])
  	@tournaments = find_tournament_with_player(@player,9)
  	@title = "Games of " + @player.surname + " " + @player.name
  	
  	@games_white = @tournaments[0]
  	@games_black = @tournaments[1]
  end
  
  def list_all_games
  	@player = Player.find(params[:id])
  	@tournaments = find_tournament_with_player(@player,10000)
  	@title = "Games of " + @player.surname + " " + @player.name
  	
  	@games_white = @tournaments[0]
  	@games_black = @tournaments[1]
  	
  end	

  def index
  end

  def destroy
  end

end
