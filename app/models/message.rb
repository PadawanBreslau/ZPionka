class Message < ActiveRecord::Base
	
	validates :user1_id, :numericality => true 
	validates :user2_id, :numericality => true 
#	validates :message, presence => true, :length => { :within => 1..1000 }
#	validates :title, presence => true, :length => { :within => 1..50 }

	
end
