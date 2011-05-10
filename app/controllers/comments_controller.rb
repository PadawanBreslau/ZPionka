class CommentsController < ApplicationController
  def new
  	@title = "Add new comment"
  	@comment = Comment.new
  	if !current_user.nil?
  		@user_id = current_user.id
  	end
  	@info_id = params[:info_id]
  end

  def create
  @comment = Comment.new(params[:comment])
  if @comment.save
    flash[:success] = "Succesfull adding comment"
    redirect_to Info.find(@comment.info_id)
  else
    @title = "Add new comment"
    render 'new'
  end
  end

  def show
 	 @comment = Comment.find(params[:id])
	  @title = "Adding comment"
  end

  def index
     @title = "Comment list" 
     @comment = Comment.paginate(:page => params[:page])
  end

  def update
  @comment = Comment.find(params[:id])
  if @comment.update_attributes(params[:comment])
    flash[:success] = "Comment succesfully updated."
    redirect_to Info.find(@comment.info_id)
  else
    @title = "Edit comment"
    render 'edit'
  end
  
  end

  def destroy
    @comment = Comment.find(params[:id])
    #@redirect_to = @comment.info_id
    @comment.destroy
    flash[:success] = "Comment destroyed."
    redirect_to_back root_path
    #redirect_to Info.find(@redirect_to)
  end

  def edit
	@title = "Edit comment"
    @comment = Comment.find(params[:id])
    if !current_user.nil?
    	@user_id = current_user.id 
	end
    @info_id = params[:info_id]
  end

end
