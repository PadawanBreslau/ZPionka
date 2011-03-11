class Tournament < ActiveRecord::Base
	validates :name, :presence => true, :length => {:within =>2..120}
	validates :start_date, :presence => true
	validates :finish_date, :presence => true
	
	has_many :rounds
	
end
