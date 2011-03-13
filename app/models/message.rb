class Message < ActiveRecord::Base
	
	validates :user1_id, :numericality => true 
	validates :user2_id, :numericality => true 
	validates :message
	validates :title
	
end
