module RoundsHelper
	
def create_new_round tournament,date,number,pgn
	round = Round.new
	round.tournament_id = tournament
	round.round_date = date
	round.round_number = number
	round.pgn = pgn
	
	if Round.find(:first, :conditions => {:tournament_id => round.tournament_id, :round_number => round.round_number}).nil?
		round.save!		
	end	
end	

def create_new_round_with_tournament_name tournament_name, date,number,pgn
	tournement_id = Tournament.find_by_name(tournament_name).id
	tournement_id ||= Tournament.last.id
	
	round = Round.new
	round.tournament_id = tournament_id
	round.round_date = date
	round.round_number = number
	round.pgn = pgn
	
	if Round.find(:first, :conditions => {:tournament_id => round.tournament_id, :round_number => round.round_number}).nil?
		round.save!		
	end	
end

def create_new_round  tournament,date,number
	round = Round.new
	round.tournament_id = tournament
	round.round_date = date
	round.round_number = number

	if Round.find(:first, :conditions => {:tournament_id => round.tournament_id, :round_number => round.round_number}).nil?
		round.save!		
	end
end	
	


end
