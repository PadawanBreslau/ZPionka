class Tourplace < ActiveRecord::Base
		
	validates :tournament_id, :presence => true, :numericality => true 
	validates :place, :presence => true, :numericality => true 
	validates :player_id, :presence => true, :numericality => true 
	
	belongs_to :player
	
	
end
