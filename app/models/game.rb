class Game < ActiveRecord::Base
	
	default_scope :order => "id ASC"
	
	validates :round_id, :presence => true
	validates :player1_id, :numericality => true 
	validates :player2_id, :numericality => true 
	validates :round_date, :presence => true
	
	belongs_to :round
	has_many :gamechat
	has_many :positions
	has_many :observes
	has_many :users, :through => :observes
	
	


end
