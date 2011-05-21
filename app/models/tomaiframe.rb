class Tomaiframe < ActiveRecord::Base	
	#http_regex = http://(www\.)?([^\.]+)\ 
	validates :url, :presence => true

end
