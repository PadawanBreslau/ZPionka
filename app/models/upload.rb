class Upload < ActiveRecord::Base

attr_accessor :picture_file_name
attr_accessor :picture_content_type
attr_accessor :picture_file_size
attr_accessor :picture_updated_at

	
	has_attached_file :picture,
	  :url => "/pgn/:basename.:extension",
      :path => ":rails_root/public/pgn/:basename.:extension"
	
end
