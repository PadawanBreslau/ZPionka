class Info < ActiveRecord::Base
	
		validates :title, :presence => true, :length => { :within => 1..50 }
		validates :lead, :presence => true, :length => { :within => 1..100 }
		validates :short_content, :presence => true, :length => { :within => 1..250 }
		validates :content, :presence => true, :length => { :within => 1..2000 }		
		belongs_to :user
	
  def show_comments(id)
	Comment.find_all_by_info_id(id)
  end		
		
end
