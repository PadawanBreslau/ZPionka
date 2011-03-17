module TournamentsHelper
	
def	tournament_observed(id)
	Observedtournament.find_by_tournament_id(id).nil?
end
	
end
