class Observedround < ActiveRecord::Base
	
	validates_uniqueness_of :user_id, :scope => [:user_id, :round_id]
	
end
