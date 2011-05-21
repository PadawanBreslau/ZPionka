class TomaiframesController < ApplicationController
  def new
  	@iframe = Tomaiframe.new
  	@title = "Creating new Iframe with tournament transmision"
  end

  def create
  @iframe = Tomaiframe.new(params[:tomaiframe])
  if @iframe.save
    redirect_to tomaiframes_path
  else
    @title = "Try once more..."
    render 'new'
  end
  end

  def edit
  	  @title = "Edit iframe"
      @user = Tomaiframe.find(params[:id])
  end

  def update
  end

  def show
  end

  def index
  	@title = "Live transmision list"
  	@iframes = Tomaiframe.paginate(:page => params[:page])
  end

  def delete
  end

end
