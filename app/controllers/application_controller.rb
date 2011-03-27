class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include InfoHelper
  include TournamentsHelper
  include RoundsHelper
  include GamesHelper
  include PlayersHelper
  
  before_filter :load_layout_variables

protected

def load_layout_variables 
	@tourchat = Tourchat.new
	@zpawn = Zpawn.new

end

end
