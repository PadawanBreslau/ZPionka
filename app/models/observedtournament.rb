class Observedtournament < ActiveRecord::Base
	
	validates_uniqueness_of :user_id, :scope => [:user_id, :tournament_id]

end
