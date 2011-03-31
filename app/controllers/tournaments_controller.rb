class TournamentsController < ApplicationController

	include Java	
	require  'lib\chesspresso.jar'

	


  def index
     @title = "Tournament list" 
     @tournaments = Tournament.paginate(:page => params[:page])
     
     @pgn_reader =  ChesspressoPgnPGNReader

     
    
  end
	
	
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
  	
  	unless signed_in?
    	cookies.permanent.signed[:watched_tournament] =  params[:id]
    	redirect_to tournaments_path
    	return
    end		
  	
  	@obstour = Observedtournament.new(:user_id => current_user.id, :tournament_id => params[:id])
  	@obstour.save
	redirect_to tournaments_path
  end
  
  def remove_from_observed_and_redirect
  	@obstour = Observedtournament.find(:first, :conditions => {:user_id => current_user.id, :tournament_id => params[:id]})
  	unless @obstour.nil?
  		@obstour.delete
  	end
  	redirect_to :back
  end	
  
  def add_to_observed_games
  	
  	Observe.new(:user_id => current_user.id, :game_id => params[:id]).save
  	redirect_to :back
  end
  
  def remove_from_observed_games
  	@observation = Observe.find(:first, :conditions => {:user_id => current_user.id, :game_id => params[:id]})
  	@observation.delete
  	
  	redirect_to :back
  end	
  	

  
    def add_to_observed_round_and_redirect
    
    unless signed_in?
    	cookies.permanent.signed[:watched_round] =  params[:round_id]
    	redirect_to :back
    	return
    end		
    
    	
    @already_observed_round = Observedround.find_by_tournament_id(params[:id])
  	@obsround = Observedround.new(:user_id => current_user.id, :tournament_id => params[:id], :round_id => params[:round_id] )
  	@obsround.save
  	unless @already_observed_round.nil? 
  		@already_observed_round.delete
  	end 
	redirect_to :back
  end
  
  def remove_from_observed_round_and_redirect
  	@obstour = Observedtournament.find(:first, :conditions => {:user_id => current_user.id, :tournament_id => params[:id]})
  	unless @obstour.nil?
  		@obstour.delete
  	end
  	redirect_to :back
  end	
  

  def show
  @tournament = Tournament.find(params[:id])
  @title = @tournament.name
  
  @rounds = @tournament.rounds
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
