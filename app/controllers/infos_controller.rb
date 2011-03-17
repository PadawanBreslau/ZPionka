class InfosController < ApplicationController
  def new
    @title = "New info"
    @info = Info.new
    @user = current_user
  end

  def create
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

  def destroy
    Info.find(params[:id]).destroy
    flash[:success] = "Info destroyed."
    redirect_to infos_path
  end

  def edit
    @title = "Edit info"
    @info = Info.find(params[:id])
  end
  
end
