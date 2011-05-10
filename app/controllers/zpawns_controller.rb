class ZpawnsController < ApplicationController
  def new
  	@title = "Add new zpawn"
  	@zpawn = Zpawn.new
  end

  def create
  @zpawn = Zpawn.new(params[:zpawn])
  if @zpawn.save
    redirect_to :back
  else
    @title = "Add new zpawn"
    render 'new'
  end
  end

  def show
  @zpawn = Zpawn.find(params[:id])
  redirect_to :back

  end

  def index
     @title = "Zpawn list" 
     @zpawns = Zpawn.find_all_by_tournament_id(params[:tournament_id])
     @zpawn = Zpawn.new
  end

  def update
  @zpawn = Zpawn.find(params[:id])
  if @zpawn.update_attributes(params[:zpawn])
    flash[:success] = "Zpawn succesfully updated."
    redirect_to Tournament.find(@zpawn.tournament_id)
  else
    @title = "Edit zpawn"
    render 'edit'
  end
  
  end

  def destroy
    Zpawn.find(params[:id]).destroy
    flash[:success] = "Zpawn destroyed."
    redirect_to_back root_path
  end

  def edit
    @title = "Edit zpawn"
    @zpawn = Zpawn.find(params[:id])
  end

end