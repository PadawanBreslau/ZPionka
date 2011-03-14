class Position < ActiveRecord::Base
	
		validates :game_id, :presence => true, :numericality => true 
		validates :v1, presence => true
		validates :v2, presence => true
		validates :v3, presence => true
		validates :move, :presence => true
		validates_numericality_of :move_number, :presence => true
		validates :white_on_move, :presence => true
		
		belongs_to :game
		
end
