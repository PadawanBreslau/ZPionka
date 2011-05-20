class MovecommentsController < ApplicationController
  
  def new
  	@title = "Add new move comment"
  	@movecomment = Movecomment.new
  	if !current_user.nil?
  		@user_id = current_user.id
  	end
  	#@info_id = params[:info_id]
  end

  def create
  @movecomment = Movecomment.new(params[:movecomment])
  if @movecomment.save
    flash[:success] = "Succesfull adding movecomment"
    redirect_to_back root_path
  else
    @title = "Add new move comment"
    render 'new'
  end
  end

  def show
 	 @movecomment = Movecomment.find(params[:id])
	  @title = "Adding movecomment"
  end

  def index
     @title = "Movecomment list" 
     @movecomment = Movecomment.paginate(:page => params[:page])
  end

  def update

  @movecomment = Movecomment.find(params[:id])
  if @movecomment.update_attributes(params[:movecomment])
    flash[:success] = "Movecomment succesfully updated."
    redirect_to_back root_path
  else
    @title = "Edit movecomment"
    render 'edit'
  end
  
  end

  def destroy
    @movecomment = Movecomment.find(params[:id])
    #@redirect_to = @movecomment.info_id
    @movecomment.destroy
    flash[:success] = "Movecomment destroyed."
    redirect_to_back root_path
    #redirect_to Info.find(@redirect_to)
  end

  def edit
	@title = "Edit movecomment"
    @movecomment = Movecomment.find(params[:id])
    if !current_user.nil?
    	@user_id = current_user.id 
	end
	@position_id = cookies['position']
  end

end
