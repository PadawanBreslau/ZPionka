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
  
  def add_to_observed_and_redirect
  	@obstour = Observedtournament.new(:user_id => current_user.id, :tournament_id => params[:id])
  	@obstour.save
	redirect_to tournaments_path
  end
  
  def remove_from_observed_and_redirect
  	@obstour = Observedtournament.find(:first, :conditions => {:user_id => current_user.id, :tournament_id => params[:id]})
  	unless @obstour.nil?
  		@obstour.delete
  	end
  	redirect_to tournaments_path
  end	
  
  def add_to_observed_games
  	
  	# TODO
  	
  	redirect_to tournaments_path
  end

  
    def add_to_observed_round_and_redirect
    @already_observed_round = Observedround.find_by_tournament_id(params[:id])
  	@obsround = Observedround.new(:user_id => current_user.id, :tournament_id => params[:id], :round_id => params[:round_id] )
  	@obsround.save
  	unless @already_observed_round.nil? 
  		@already_observed_round.delete
  	end 
	redirect_to tournaments_path
  end
  
  def remove_from_observed_round_and_redirect
  	@obstour = Observedtournament.find(:first, :conditions => {:user_id => current_user.id, :tournament_id => params[:id]})
  	unless @obstour.nil?
  		@obstour.delete
  	end
  	redirect_to tournaments_path
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
