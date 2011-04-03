class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include InfoHelper
  include TournamentsHelper
  include RoundsHelper
  include GamesHelper
  include PlayersHelper
  
  before_filter :load_layout_variables


		
  include Java 	
  require  'lib\chesspresso-lib'
  include_class 'chesspresso.pgn.PGNReader'
  include_class ('chesspresso.game.Game') {|package,name| "J" + name}
  include_class 'chesspresso.game.view.GameBrowser'
  include_class 'javax.swing.JButton'
  include_class 'javax.swing.JPanel'
  include_class 'javax.swing.JFrame'

protected

def load_layout_variables 
	@tourchat = Tourchat.new
	@zpawn = Zpawn.new

end

end
