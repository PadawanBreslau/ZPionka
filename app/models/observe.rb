class Observe < ActiveRecord::Base
	
	default_scope :order => "game_id ASC"
	
	validates :user_id, :numericality => true 
	validates :game_id, :numericality => true 
	
	validates_uniqueness_of :user_id, :scope => [:game_id]

	
	belongs_to :user
	belongs_to :game
	
end
