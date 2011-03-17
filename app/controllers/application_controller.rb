class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include InfoHelper
  include TournamentsHelper
end
