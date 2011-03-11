class Player < ActiveRecord::Base
	validates :name, :length => {:within =>{2,15}}
	validates :surname, :length => {:within =>{2,25}}
	validates :rating, :numericality => true, :on => :create, :greater_than_or_equal_to => 1000, :less_than_or_equal_to => 2800
	
	has_many :games
	has_many :tourplaces
	 
end
