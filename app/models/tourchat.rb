class Tourchat < ActiveRecord::Base\
	
	validates :user_id, :numericality => true 
	validates :tournament_id, :numericality => true 
	validates :content, :presence => true
end
