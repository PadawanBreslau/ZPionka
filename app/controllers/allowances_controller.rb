class AllowancesController < ApplicationController
  
  def new	
  	@allowance = Allowance.new
  	@title = "Giving permisions"
  end
  
  def create
  	@allowance = Allowance.new(params[:allowance])	
    if @allowance.description == "Superadmin"
  		@allowance.allowance_level = 1
  	elsif @allowance.description == "Admin"
  		@allowance.allowance_level = 2
  	elsif @allowance.description == "Moderator"
  		@allowance.allowance_level = 3
  	elsif @allowance.description == "Article Writer"
  		@allowance.allowance_level = 4
  	else
  		@allowance.allowance_level = 5
  	end
  	
  	@allowance.user_id = User.find_by_login(@allowance.user_login).id
  	
  	if @allowance.save
   	  flash[:success] = "Udane dodanie"
   	  delete_where_user_id_and_not_id(@allowance)
  	  redirect_to user_list_path
  	else
    	@title = "Something wrong during changing permission"
    	render 'new'
  	end
  	
  end
  

  def edit
  end

  def destroy
  end
  
  private
  def delete_where_user_id_and_not_id (allowance)
 	 @all_find = Allowance.find(:all, :conditions => ["user_id = ?",allowance.user_id])
  	 @all_find.each do |allow|
  	 	unless allow.id == allowance.id 
  	 		allow.delete
  	 	end
  	 end	
  end
  
end
