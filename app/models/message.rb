class Message < ActiveRecord::Base
	
	validates :user1_id, :numericality => true 
	validates :user2_id, :numericality => true 
	validates :message, :length => {:within => 2..120}
	validates :title, :length => {:within => 2..40}
	
end
