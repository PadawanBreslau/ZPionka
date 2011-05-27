class PlayersController < ApplicationController
  def new
  end

  def create
  end

  def edit
  	  	@player = Player.find(params[:id])
  	  	@title = "Editing player info"
  	
  end

  def update
  	
  @player = Player.find(params[:id])
  if @player.update_attributes(params[:player])
    flash[:success] = "Player succesfully updated."
    redirect_to @player
  else
    @title = "Edit player"
    render 'edit'
  end
    	
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
  	
  	@players = Player.paginate(:page => params[:page], :per_page => 12)
  end
  

  
  def destroy
  end

end
