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
    redirect_to @tourchat
  else
    @title = "Edit tourchat"
    render 'edit'
  end
  
  end

  def destroy
    Tourchat.find(params[:Tourchat]).destroy
    flash[:success] = "Tourchat destroyed."
    redirect_to tourchat_path
  end

  def edit
    @title = "Edit tourchat"
    @tourchat = Tourchat.find(params[:id])
  end

end
