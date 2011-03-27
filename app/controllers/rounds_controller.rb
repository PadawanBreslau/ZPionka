class RoundsController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def show
  	@round = Round.find(params[:id])
  	@games = @round.games
  	
  end
  
  def index
  	@tournament = Tournament.find(:all,:limit => 10)

  end

  def destroy
  end

end
