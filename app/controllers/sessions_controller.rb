class SessionsController < ApplicationController
def new
  @title = "Logowanie"
end

def create
  user = User.authenticate(params[:session][:login], params[:session][:password])
  if user.nil?
    flash.now[:error] = "Invalid email/password combination."
    @title = "Sign in"
    redirect_to_back
  else
    sign_in user
    redirect_back_or root_path
    # redirect_back_or user
end
end

def destroy
  sign_out
  redirect_to root_path
end

end