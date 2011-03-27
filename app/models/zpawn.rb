class Zpawn < ActiveRecord::Base
	default_scope :order => "updated_at DESC"
	
	validates :tournament_id, :presence => true
	validates :user_id, :presence => true
	validates :content, :presence => true
	
end
