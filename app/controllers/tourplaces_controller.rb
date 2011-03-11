class TourplacesController < ApplicationController
  def new
  	@title = "Add new tourplace"
  	@tourplace = Tourplace.new
  end

  def create
  @tourplace = Tourplace.new(params[:tourplace])
  if @tourplace.save
    flash[:success] = "Succesfull adding tourplace"
    redirect_to @tourplace
  else
    @title = "Add new tourplace"
    render 'new'
  end
  end

  def show
  @tourplace = Tourplace.find(params[:id])
  end

  def index
     @title = "Tourplace list" 
     @tourplace = Tourplace.paginate(:page => params[:page])
  end

  def update
  @tourplace = Tourplace.find(params[:id])
  if @tourplace.update_attributes(params[:tourplace])
    flash[:success] = "Tourplace succesfully updated."
    redirect_to @tourplace
  else
    @title = "Edit tourplace"
    render 'edit'
  end
  
  end

  def destroy
    Tourplace.find(params[:Tourplace]).destroy
    flash[:success] = "Tourplace destroyed."
    redirect_to tourplace_path
  end

  def edit
    @title = "Edit tourplace"
    @tourplace = Tourplace.find(params[:id])
  end

end
