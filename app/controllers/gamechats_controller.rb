class GamechatsController < ApplicationController
  def new
  	@title = "Add new gamechat"
  	@gamechat = Gamechat.new
  	
  	#redirect_to Game.find(@gamechat.game_id)
  end

  def create
  @gamechat = Gamechat.new(params[:gamechat])
  if @gamechat.save
    redirect_to :back
  else
  	redirect_to :back
  end
  end

  def show
  @gamechat = Gamechat.find(params[:id])

  end

  def index
     @title = "Gamechat list" 
     @gamechats = Gamechat.find_all_by_game_id(params[:game_id])
     @gamechat = Gamechat.new
  end

  def update
  @gamechat = Gamechat.find(params[:id])
  if @gamechat.update_attributes(params[:gamechat])
    flash[:success] = "Gamechat succesfully updated."
    redirect_to Game.find(@gamechat.game_id)
  else
    @title = "Edit gamechat"
    render 'edit'
  end
  
  end

  def destroy
  	@game = Game.find(Gamechat.find(params[:id]).game_id)
    Gamechat.find(params[:id]).destroy
    flash[:success] = "Gamechat destroyed."
    redirect_to @game
  end

  def edit
    @title = "Edit gamechat"
    @gamechat = Gamechat.find(params[:id])
  end

end
