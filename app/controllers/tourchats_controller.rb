class TourchatsController < ApplicationController
  def new
  	@title = "Add new tourchat"
  	@tourchat = Tourchat.new
  end

  def create
  @tourchat = Tourchat.new(params[:tourchat])
  if @tourchat.save
    redirect_to :back
  else
    @title = "Add new tourchat"
    render 'new'
  end
  end

  def show
  @tourchat = Tourchat.find(params[:id])

  end

  def index
     @title = "Tourchat list" 
     @tourchats = Tourchat.find_all_by_tournament_id(params[:tournament_id])
     @tourchat = Tourchat.new
  end

  def update
  @tourchat = Tourchat.find(params[:id])
  if @tourchat.update_attributes(params[:tourchat])
    flash[:success] = "Tourchat succesfully updated."
    redirect_to Tournament.find(@tourchat.tournament_id)
  else
    @title = "Edit tourchat"
    render 'edit'
  end
  
  end

  def destroy
  	@tournament = Tournament.find(Tourchat.find(params[:id]).tournament_id)
    Tourchat.find(params[:id]).destroy
    flash[:success] = "Tourchat destroyed."
    redirect_to @tournament
  end

  def edit
    @title = "Edit tourchat"
    @tourchat = Tourchat.find(params[:id])
  end

end
