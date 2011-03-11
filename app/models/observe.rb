class Observe < ActiveRecord::Base
	
	validates :user_id, :numericality => true 
	validates :game_id, :numericality => true 
	
	belongs_to :user
	belongs_to :game
	
end
