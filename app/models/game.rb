class Game < ActiveRecord::Base
	
	validates :player1_id, :numericality => true 
	validates :player2_id, :numericality => true 
	
	belongs_to :round
	has_many :gamechat
	has_many :positions
	has_many :observes
end
