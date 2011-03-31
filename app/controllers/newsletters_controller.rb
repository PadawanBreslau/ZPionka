class NewslettersController < ApplicationController
  def new
    @title = "New newsletter"
    @newsletter = Newsletter.new

  end

  def create
  @newsletter = Newsletter.new(params[:newsletter])
  @newsletter.user_id = current_user.id
  
  if @newsletter.save
    flash[:success] = "Succesfull adding"
    send_message(@newsletter)
    redirect_to @newsletter
  else
    @title = "Add new newsletter"
    render 'new'
  end
  end

  def show
  @newsletter = Newsletter.find(params[:id])
  @title = @newsletter.title
  end

  def index
     @title = "Newsletter list" 
     @newsletter = Newsletter.paginate(:page => params[:page])
  end

  def update
  @newsletter = Newsletter.find(params[:id])
  if @newsletter.update_attributes(params[:newsletter])
    flash[:success] = "Newsletter succesfully updated."
    redirect_to @newsletter
  else
    @title = "Edit newsletter"
    render 'edit'
  end
  
  end

  def destroy
    Newsletter.find(params[:id]).destroy
    flash[:success] = "Newsletter destroyed."
    redirect_to newsletters_path
  end

  def edit
    @title = "Edit newsletter"
    @newsletter = Newsletter.find(params[:id])
  end

  def send_message newsletter
  @users = User.find(:all, :conditions => ["Users.newsletter=?", true])	
  	@users.each do |user|	
  		UserMailer.send_newsletter(newsletter,user).deliver
  	end
  end

end
