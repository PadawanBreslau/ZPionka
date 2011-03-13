class Tournament < ActiveRecord::Base
	validates :name, :presence => true
	validates :start_date, :presence => true
	validates :finish_date, :presence => true
	
	has_many :rounds
	
end
