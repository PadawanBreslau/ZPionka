class TournamentsController < ApplicationController
  def new
  	@title = "Add new tournament"
  	@tournament = Tournament.new
  end

  def create
  @tournament = Tournament.new(params[:tournament])
  if @tournament.save
    flash[:success] = "Succesfull adding tournament"
    redirect_to @tournament
  else
    @title = "Add new tournament"
    render 'new'
  end
  end

  def show
  @tournament = Tournament.find(params[:id])
  @title = @tournament.name
  end

  def index
     @title = "Tournament list" 
     @tournaments = Tournament.paginate(:page => params[:page])
  end

  def update
  @tournament = Tournament.find(params[:id])
  if @tournament.update_attributes(params[:tournament])
    flash[:success] = "Tournament succesfully updated."
    redirect_to @tournament
  else
    @title = "Edit tournament"
    render 'edit'
  end
  
  end

  def destroy
    Tournament.find(params[:Tournament]).destroy
    flash[:success] = "Tournament destroyed."
    redirect_to tournament_path
  end

  def edit
    @title = "Edit tournament"
    @tournament = Tournament.find(params[:id])
  end

end
