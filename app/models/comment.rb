class Comment < ActiveRecord::Base
	
	validates :content, :presence => true, :length => { :within => 1..200 }
	
	belongs_to :user
	belongs_to :info
	
	
	def find_user(id)
		User.find(id).login
	end	

end
