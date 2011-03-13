class Info < ActiveRecord::Base
	
		validates :title, :presence => true
		validates :lead
		validates :short_content, :presence => true
		validates :content, :presence => true
		
		belongs_to :user
	
  def show_comments(id)
	Comment.find_all_by_info_id(id)
  end		
		
end
