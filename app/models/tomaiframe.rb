class Tomaiframe < ActiveRecord::Base	
	#http_regex = http://(www\.)?([^\.]+)\
	
	belongs_to :tournament
	
	default_scope :order => "created_at DESC"
	 
	validates :url, :presence => true
	validates :tournament_name, :presence => true

end
