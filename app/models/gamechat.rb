class Gamechat < ActiveRecord::Base
	
	validates :user_id, :numericality => true 
	validates :game_id, :numericality => true 
	validates :content, :length => {:within => {2,120}}
	
	belongs_to :game
	belongs_to :user
	
end
