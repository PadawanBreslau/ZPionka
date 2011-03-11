class MessagesController < ApplicationController
  def new
    @title = "New message" 
    @message = Message.new
  end

  def create
  @message = Message.new(params[:message])
  if @message.save
    flash[:success] = "Succesfully sent"
    redirect_to @message
  else
    @title = "Rejestracja"
    render 'new'
  end
end

def index
 @title = "message list" 
 @messages = Message.find_all_by_user2_id(current_user.id)
end

def show
  @message = Message.find(params[:id])
  @title = @message.title
end

  def update
  end

  def edit
      @title = "Edit message"
  end

  def destroy
    Message.find(params[:id]).destroy
    flash[:success] = "message destroyed."
    redirect_to messages_path
  end

end
