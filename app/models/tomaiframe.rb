class Tomaiframe < ActiveRecord::Base	
	#http_regex = http://(www\.)?([^\.]+)\
	
	default_scope :order => "created_at DESC"
	 
	validates :url, :presence => true
	validates :tournament_name, :presence => true

end
