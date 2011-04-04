class PgnController < ApplicationController
  def add_pgn
  	@pgn = String.new
  	@upload = Upload.new
  end
  
  
  def parse_pgn
	
  	if params[:upload].blank? 	
		redirect_to root_path
	end
	
	#File.new(params[:upload])
	
	post = DataFile.save_file(params[:upload])
 	
  end
  
  def add_tournament_pgn
  	
  end
  
  def add_round_pgn
  	
  end
  
  def add_game_pgn
  	
  end

end
