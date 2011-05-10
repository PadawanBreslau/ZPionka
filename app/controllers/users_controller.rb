class UsersController < ApplicationController
  def new
    @title = "New User" 
    @user = User.new
  end

  def create
  @user = User.new(params[:user])
    	  	
  if @user.save 
      
    @allowance = Allowance.new
  	@allowance.user_id = @user.id
  	@allowance.allowance_level = 5
  	@allowance.description = "User"
  	@allowance.save!
  
    flash[:success] = "Udane dodanie"
	UserMailer.welcome_email(@user).deliver
	redirect_to @user
    sign_in @user
    
    
  else
    @title = "Rejestracja"
    render 'new'
  end
end

def index
 @title = "User list" 
 @user = User.paginate(:page => params[:page])
end

def show
  @user = User.find(params[:id])
  @title = @user.login 
  
  @games = @user.games
  @comments = @user.comments

end

def update
  @user = User.find(params[:id])
  if @user.update_attributes(params[:user])
    flash[:success] = "User succesfully updated."
    redirect_to @user
  else
    @title = "Edit user"
    render 'edit'
  end
end

  def edit
      @title = "Edit user"
      @user = User.find(params[:id])
  end

  def destroy
      User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

end
