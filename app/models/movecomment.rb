class Movecomment < ActiveRecord::Base
	
	validates :content, :presence => true , :length => { :within => 1..250 }
	validates :user_id, :presence => true
	validates :position_id, :presence => true
	
end
