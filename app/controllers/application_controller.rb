class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include InfoHelper
  include TournamentsHelper
  
  before_filter :load_layout_variables

protected

def load_layout_variables 
	@tourchat = Tourchat.new

end

end
