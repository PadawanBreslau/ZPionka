class Gamechat < ActiveRecord::Base
	
	default_scope :order => "created_at DESC"
	
	
	validates :user_id, :numericality => true 
	validates :game_id, :numericality => true 
	validates :comment, :presence => true,  :length => { :within => 1..120 }

	
	belongs_to :game
	belongs_to :user
	
end
