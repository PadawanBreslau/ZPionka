class Tourchat < ActiveRecord::Base
	
	 default_scope :order => "created_at DESC"

	
	validates :user_id, :numericality => true 
	validates :tournament_id, :numericality => true 
	validates :content, :presence => true
end
