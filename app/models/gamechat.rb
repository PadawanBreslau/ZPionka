class Gamechat < ActiveRecord::Base
	
	validates :user_id, :numericality => true 
	validates :game_id, :numericality => true 
	validates :content, :length => [2..100]
	
	belongs_to :game
	belongs_to :user
	
end
