class InfosController < ApplicationController
  def new
    @title = "New info"
    @info = Info.new
    if !current_user.nil?
    	@user = current_user
    else
    	@user = User.new
    end
  end

  def create
  @user = current_user
  @info = Info.new(params[:info])
  if @info.save
    flash[:success] = "Succesfull adding"
    redirect_to @info
  else
    @title = "Add new info"
    render 'new'
  end
  end

  def show
  @info = Info.find(params[:id])
  @title = @info.title
  @user = User.find(@info.user_id)
  
  
  end

  def index
     @title = "Info list" 
     @info = Info.paginate(:page => params[:page])
     
  end

  def update
  @info = Info.find(params[:id])
  if @info.update_attributes(params[:info])
    flash[:success] = "Info succesfully updated."
    redirect_to @info
  else
    @title = "Edit info"
    render 'edit'
  end
  
  end
  
  def delete
  	
  end	

  def destroy
    Info.find(params[:id]).destroy
    flash[:success] = "Info destroyed."
    redirect_to infos_path
  end

  def edit
    @title = "Edit info"
    @info = Info.find(params[:id])
  end
  
  def index_user
  	@title = "User info list"
  end
  
end
