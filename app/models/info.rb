class Info < ActiveRecord::Base
	
		validates :title, :presence => true, :length => { :within => 1..100 }
		validates :lead, :length => { :within => 1..200 }
		validates :short_content, :presence => true, :length => { :within => 1..500 }
		validates :content, :presence => true, :length => { :within => 1..2500 }
		
		belongs_to :user
	
  def show_comments(id)
	Comment.find_all_by_info_id(id)
  end		
		
end
