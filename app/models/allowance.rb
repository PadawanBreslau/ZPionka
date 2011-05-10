class Allowance < ActiveRecord::Base

 #validates :user_id, :presence => true, :numericality => true
 
 belongs_to :user
 

 
  
def self.isAdmin?(user_id) 
	@user = find_by_user_id(user_id)
	unless @user == nil
		return @user.allowance_level == 1
	end
	return 0
end  
  
end


private


