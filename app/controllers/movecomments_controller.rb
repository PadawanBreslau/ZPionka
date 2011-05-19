class MovemovecommentsController < ApplicationController
  def new
  	@title = "Add new movecomment"
  	@movecomment = Movemovecomment.new
  	if !current_user.nil?
  		@user_id = current_user.id
  	end
  	@info_id = params[:info_id]
  end

  def create
  @movecomment = Movemovecomment.new(params[:movecomment])
  if @movecomment.save
    flash[:success] = "Succesfull adding movecomment"
    redirect_to Info.find(@movecomment.info_id)
  else
    @title = "Add new movecomment"
    render 'new'
  end
  end

  def show
 	 @movecomment = Movemovecomment.find(params[:id])
	  @title = "Adding movecomment"
  end

  def index
     @title = "Movemovecomment list" 
     @movecomment = Movemovecomment.paginate(:page => params[:page])
  end

  def update
  @movecomment = Movemovecomment.find(params[:id])
  if @movecomment.update_attributes(params[:movecomment])
    flash[:success] = "Movemovecomment succesfully updated."
    redirect_to Info.find(@movecomment.info_id)
  else
    @title = "Edit movecomment"
    render 'edit'
  end
  
  end

  def destroy
    @movecomment = Movemovecomment.find(params[:id])
    #@redirect_to = @movecomment.info_id
    @movecomment.destroy
    flash[:success] = "Movemovecomment destroyed."
    redirect_to_back root_path
    #redirect_to Info.find(@redirect_to)
  end

  def edit
	@title = "Edit movecomment"
    @movecomment = Movemovecomment.find(params[:id])
    if !current_user.nil?
    	@user_id = current_user.id 
	end
    @info_id = params[:info_id]
  end

end
