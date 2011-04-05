class UploadsController < ApplicationController
  def new
  	@title = "Add new upload"
  	@upload = Upload.new
  end

  def create
    @upload = Upload.new(params[:upload])
    
    
    if @upload.save
      render :json => { :pic_path => @upload.picture.url.to_s , :name => @upload.picture.instance.attributes["picture_file_name"] }, :content_type => 'text/html'      
    else
       render :json => { :result => 'error'}, :content_type => 'text/html'
    end   
       insert_PGN_tournament_file_into_database ("public/" + @upload.picture.url.to_s.split("?")[0])
    end


  def show
  @upload = Upload.find(params[:id])
  redirect_to :back

  end

  def index
     @title = "Upload list" 
     @uploads = Upload.find_all_by_tournament_id(params[:tournament_id])
     @upload = Upload.new
  end

  def update
  @upload = Upload.find(params[:id])
  if @upload.update_attributes(params[:upload])
    flash[:success] = "Upload succesfully updated."
    redirect_to Tournament.find(@upload.tournament_id)
  else
    @title = "Edit upload"
    render 'edit'
  end
  
  end

  def destroy
    Upload.find(params[:id]).destroy
    flash[:success] = "Upload destroyed."
    redirect_to :back
  end

  def edit
    @title = "Edit upload"
    @upload = Upload.find(params[:id])
  end

end
