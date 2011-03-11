class Round < ActiveRecord::Base
	validates :tournament_id, :presence => true, :numericality => true 
	validates :round_number, :presence => true, :numericality => true 
	
	has_many :games
	belongs_to :tournament
end
