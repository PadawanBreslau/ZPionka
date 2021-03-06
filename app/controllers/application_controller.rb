class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include InfoHelper
  include TournamentsHelper
  include RoundsHelper
  include GamesHelper
  include PlayersHelper
  include PgnHelper
  
  before_filter :load_layout_variables

unless  Rails.application.config.consider_all_requests_local
  rescue_from Exception, :with => :render_404
end


		
  include Java 	
  require  'lib\chesspresso-lib'
  include_class 'chesspresso.pgn.PGNReader'
  include_class ('chesspresso.game.Game') {|package,name| "J" + name}
  include_class 'chesspresso.game.view.GameBrowser'
  include_class 'javax.swing.JButton'
  include_class 'javax.swing.JPanel'
  include_class 'javax.swing.JFrame'
  include_class 'java.awt.GridLayout'
  include_class 'javax.swing.JButton'
 # include_class 'javax.swing.ActionListener'
  include_class 'java.awt.BorderLayout'
  include_class 'java.awt.event.ActionListener'
  include_class 'chesspresso.engines.ChXBoardEngine'
  #require 'jruby_utils'

protected

def load_layout_variables 
	@tourchat = Tourchat.new
	@gamechat = Gamechat.new
	@zpawn = Zpawn.new
	@movecomment = Movecomment.new
end

def redirect_to_back(default = root_url)
    if !request.env["HTTP_REFERER"].blank? and request.env["HTTP_REFERER"] != request.env["REQUEST_URI"]
      redirect_to :back
    else
      redirect_to default
    end
end


end
