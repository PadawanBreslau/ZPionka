class Position < ActiveRecord::Base
	
		validates :game_id, :presence => true, :numericality => true 
		validates :v1, :length => {:within =>{3,120}}
		validates :v2, :length => {:within =>{3,120}}
		validates :v3, :length => {:within =>{3,120}}
		validates :move, :presence => true, :length => {:within =>{2,6}}
		validates_numericality_of :move_number, :presence => true, :on => :create, :greater_than_or_equal_to => 1, :less_than_or_equal_to => 299
		validates :white_on_move, :presence => true
		
		belongs_to :game
		
end
