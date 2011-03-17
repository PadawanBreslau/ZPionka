class UsersController < ApplicationController
  def new
    @title = "New User" 
    @user = User.new
  end

  def create
  @user = User.new(params[:user])
  if @user.save
    flash[:success] = "Udane dodanie"
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
end

  def update
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
