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
      @iframe = Tomaiframe.find(params[:id])
  end

  def update
  end
  
  def match_with_tournament
  	  @title = "Matching live broadcast with tournaments"
      @iframe = Tomaiframe.find(params[:id])
      @tournaments = Tournament.all
      
      
  end
  
  def match_and_back_to_iframe
  	 @iframe = Tomaiframe.find(params[:iframe_id]) 
  	 @iframe.tournament_id = params[:tournament_id]
  	 @iframe.save!
  	
  	 flash[:success] = "Udane dodanie"
  	 redirect_to tomaiframes_path
  end
  
  def finish_or_open_broadcast
  	 @iframe = Tomaiframe.find(params[:id])
  	 if params[:what] == "close"
  	 	@iframe.is_finished = true
  	 else
  	 	@iframe.is_finished = false
  	 end
  	 @iframe.save!
  	 
  	 redirect_to tomaiframes_path
  end	

  def show
      @iframe = Tomaiframe.find(params[:id])
  	  @title = "Live broadcast from " + @iframe.tournament_name
  	  
  	  @tournament = @iframe.tournament
  	  if @tournament.nil?
  	  	@tournament_link = '<span class="h3_stripe">This broadcast is not connected with tournament</span>'
  	  else
  	  	@tournament_link = '<span class="h3_stripe">Tournament results and infos</span>'
  	  end
  	  
  	  	
      
  	  if @iframe.optional_code == ""
  	  
  	 	if @iframe.width.nil?
  	  		@iframe_width = ""
  	  	else
  	  		@iframe_width = "width='"+@iframe.width.to_s+"' "
  	  	end
  	  
  	  	if @iframe.height.nil?
  	  		@iframe_height = ""
  	  	else
  	  		@iframe_height = "height='"+@iframe.height.to_s+"' "
  	  	end
  	  
  	  	@iframe_string = "<iframe src='" + @iframe.url + "' " + @iframe_width + @iframe_height + " frameborder='" + @iframe.frameborder ="'  scrolling='" + @iframe.scrolling ="'  marginheight='" + @iframe.marginheight ="'  marginwidth='" + @iframe.marginwidth ="'></iframe>"
  	  else
  	  	@iframe_string = @iframe.optional_code
  	  end
  	
  end

  def index
  	@title = "Live transmision list"
  	@iframes = Tomaiframe.paginate(:page => params[:page])
  end

  def delete
  end

end
