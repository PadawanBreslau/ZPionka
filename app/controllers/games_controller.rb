class GamesController < ApplicationController
  

	
  def new
  end


  def create
  end

  def edit
  end

  def destroy
  end

  def index
  end
  
  def read_pgn_file file
  	@pgn_string = ""
  	 if File.file? file 
  	 myfile = File.open file.path, "r" do |f1|
  		while line = f1.gets 
  			 @pgn_string += line.to_s
		end
	end
	@pgn_string
  end 
  		
  end

  def show
  	if Game.find(params[:id])!=nil?
  		@game = Game.find(params[:id])
  		@file = File.new @game.pgn_file.to_s
  		@pgn_string = read_pgn_file @file
  		
  		
  		
  		@nextgame = Game.find(@game.id+1) rescue @game
  		@prevgame = Game.find(@game.id-1) rescue @game
  		
  		if @nextgame==@game || @nextgame.round!=@game.round
  			@nextroundgame = @nextgame
  			@nextgame=@game
  		end
  		
  		if @prevgame==@game || @prevgame.round!=@game.round
  			@prevroundgame = @prevgame
  			@prevgame=@game
  		end
  			

  		
  	
  		@game_pgn = PGNReader.new @game.pgn_file
  		@ggame = @game_pgn.parse_game
	
  		unless @game.pgn_file.nil?
  			@game_pgn = PGNReader.new @game.pgn_file
  			@ggame = @game_pgn.parse_game
  			@round = @ggame.get_round
  		  	@player_white = Player.find(@game.player1_id)
  			@player_black = Player.find(@game.player2_id)
  	
  		else	
  		
 	 		@game_pgn = PGNReader.new
 	 		@player_white = Player.find(@game.player1_id)
 	 		@player_black = Player.find(@game.player2_id)#.surname
  	  	
  		end
  		
	end
	
	@positions = @game.positions
	
	cookies['position_start'] = @game.positions.first.id
    cookies['position_last'] =  @game.positions.last.id
	
	 unless cookies['position'].nil? 	
		cookies.delete 'position'	
	 end 

    
    cookies['position'] = cookies['position_start']
    
	
   @position = @positions.first.id
   cookies[:position] = @position
  	
  	

  	#@engine = ChXBoardEngine.new "vendor/jazz/jazz-wb-444-32-ja.exe","vendor/jazz" 
  	#@engine.init
  	#@engine.send_message "xboard"
  	#  	@myresult1 = @engine.wait_for_answer
  	#@engine.send_message "depth 10"
  	#@engine.send_message "setboard "+@positions.first.fen
  	#@engine.send_message "post"
  	#@engine.send_message "analyze"
  	 # 	@myresult2 = @engine.wait_for_answer 1000,6
  	 #	@myresult3 = @engine.wait_for_answer 1000,6
  	 #  @myresult4 = @engine.wait_for_answer 1000,6
  	 #	@myresult5 = @engine.wait_for_answer 1000,6
  	 #	@myresult6 = @engine.wait_for_answer 1000,6


  	#@engine.send_message "stop"
    #@engine.quit
  	
  end
  
  def find_next_game observes, windows, position   # lista, zajęte, na której pozycji zmiana
	@current_game = windows[position]
	
	(@current_game..observes.size-1).each do |i|
		if i!= windows[0] && i!= windows[1] && i!= windows[2] && i!= windows[3]
			return windows[position] = i
		end
	end	
		
#		if @current_game == windows[position]
#			(1..@current_game).each do |i|
#				if i!= windows[0] && i!= windows[1] && i!= windows[2] && i!= windows[3]
#					return windows[position] = i
#				end
#			end	
#		end
	
	windows[position]
  end	
  
def find_prev_game observes, windows, position   # lista, zajęte, na której pozycji zmiana
	@current_game = windows[position]
	
	(0..@current_game-1).each do |i|
		if i!= windows[0] && i!= windows[1] && i!= windows[2] && i!= windows[3]
			windows[position] = i
		end
	end	
	windows[position]
end
  
  
  def show_games_in_java_window
  	 
  	@actionListener = java.awt.event.ActionListener.new
  	
  	@observes = Observe.find_all_by_user_id(current_user)
  	
  	
    if @observes.empty? || @observes.size < 4 
  		redirect_to_back root_path
  		return
  	end
  	
  	@windows = [0,1,2,3]

  	
  	@game1 = Game.find(@observes[0].game_id)
  	@game_pgn = PGNReader.new @game1.pgn_file
  	@parsed_game = @game_pgn.parse_game
  	@browser1 = GameBrowser.new @parsed_game
  	
  	@game2 = Game.find(@observes[1].game_id)
  	@game_pgn = PGNReader.new @game2.pgn_file
  	@parsed_game = @game_pgn.parse_game
  	@browser2 = GameBrowser.new @parsed_game
  	
  	@game3 = Game.find(@observes[2].game_id)
  	@game_pgn = PGNReader.new @game3.pgn_file
  	@parsed_game = @game_pgn.parse_game
  	@browser3 = GameBrowser.new @parsed_game
  	
  	@game4 = Game.find(@observes[3].game_id)
  	@game_pgn = PGNReader.new @game4.pgn_file
  	@parsed_game = @game_pgn.parse_game
  	@browser4 = GameBrowser.new @parsed_game
  	
  	@frame = JFrame.new "Window to display games"
  	@frame.set_visible true
  	@frame.set_location 20, 20
  	@frame.set_size 1080, 800
  #	@frame.set_extended_state(Frame.MAXIMIZED_BOTH); 
  	
  	@panel1 = JPanel.new
  	@panel1.set_layout BorderLayout.new
  	@panel1.add @browser1, BorderLayout::CENTER
  	@panel1.set_size 540, 360
	@panel1.set_visible true
	
	@button1_1 = JButton.new "Previous game"
	@button1_1.addActionListener do |e|
		@prev_game = find_prev_game @observes, @windows, 0
		@panel1.remove @browser1
        @game = Game.find(@observes[@prev_game].game_id)
        @game_pgn = PGNReader.new @game.pgn_file
  		@parsed_game = @game_pgn.parse_game
  		@browser1 = GameBrowser.new @parsed_game
  		@panel1.add @browser1, BorderLayout::CENTER
  		@panel1.revalidate
  		@panel1.repaint 
	
    end
    
    @button1_2 = JButton.new "Next game"
	@button1_2.addActionListener do |e|
		@next_game = find_next_game @observes, @windows, 0
		@panel1.remove @browser1
        @game = Game.find(@observes[@next_game].game_id)
        @game_pgn = PGNReader.new @game.pgn_file
  		@parsed_game = @game_pgn.parse_game
  		@browser1 = GameBrowser.new @parsed_game
  		@panel1.add @browser1, BorderLayout::CENTER
  		@panel1.revalidate
  		@panel1.repaint 
	
    end
    
    @panel_buttons_1 = JPanel.new

	@panel_buttons_1.add @button1_1
	@panel_buttons_1.add @button1_2
	@panel1.add @panel_buttons_1, BorderLayout::SOUTH
	
	@panel2 = JPanel.new
  	@panel2.set_layout BorderLayout.new
  	@panel2.add @browser2, BorderLayout::CENTER
  	@panel2.set_size 540, 360
	@panel2.set_visible true
	
	@button2_1 = JButton.new "Previous game"
	@button2_1.addActionListener do |e|
		@prev_game = find_prev_game @observes, @windows, 1
		@panel2.remove @browser2
        @game = Game.find(@observes[@prev_game].game_id)
        @game_pgn = PGNReader.new @game.pgn_file
  		@parsed_game = @game_pgn.parse_game
  		@browser2 = GameBrowser.new @parsed_game
  		@panel2.add @browser2, BorderLayout::CENTER
  		@panel2.revalidate
  		@panel2.repaint 
	
    end
    
    @button2_2 = JButton.new "Next game"
	@button2_2.addActionListener do |e|
		@next_game = find_next_game @observes, @windows, 1
		@panel2.remove @browser2
        @game = Game.find(@observes[@next_game].game_id)
        @game_pgn = PGNReader.new @game.pgn_file
  		@parsed_game = @game_pgn.parse_game
  		@browser2 = GameBrowser.new @parsed_game
  		@panel2.add @browser2, BorderLayout::CENTER
  		@panel2.revalidate
  		@panel2.repaint 
	
    end
    
    @panel_buttons_2 = JPanel.new

	@panel_buttons_2.add @button2_1
	@panel_buttons_2.add @button2_2
	@panel2.add @panel_buttons_2, BorderLayout::SOUTH
	
	@panel3 = JPanel.new
  	@panel3.set_layout BorderLayout.new
  	@panel3.add @browser3, BorderLayout::CENTER
  	@panel3.set_size 540, 360
	@panel3.set_visible true
	
	@button3_1 = JButton.new "Previous game"
	@button3_1.addActionListener do |e|
		@prev_game = find_prev_game @observes, @windows, 2
		@panel3.remove @browser3
        @game = Game.find(@observes[@prev_game].game_id)
        @game_pgn = PGNReader.new @game.pgn_file
  		@parsed_game = @game_pgn.parse_game
  		@browser3 = GameBrowser.new @parsed_game
  		@panel3.add @browser3, BorderLayout::CENTER
  		@panel3.revalidate
  		@panel3.repaint 
	
    end
    
    @button3_2 = JButton.new "Next game"
	@button3_2.addActionListener do |e|
		@next_game = find_next_game @observes, @windows, 2
		@panel3.remove @browser3
        @game = Game.find(@observes[@next_game].game_id)
        @game_pgn = PGNReader.new @game.pgn_file
  		@parsed_game = @game_pgn.parse_game
  		@browser3 = GameBrowser.new @parsed_game
  		@panel3.add @browser3, BorderLayout::CENTER
  		@panel3.revalidate
  		@panel3.repaint 
	
    end
    
    @panel_buttons_3 = JPanel.new

	@panel_buttons_3.add @button3_1
	@panel_buttons_3.add @button3_2
	@panel3.add @panel_buttons_3, BorderLayout::SOUTH
	
	@panel4 = JPanel.new
  	@panel4.set_layout BorderLayout.new
  	@panel4.add @browser4, BorderLayout::CENTER
  	@panel4.set_size 540, 360
	@panel4.set_visible true
	
	@button4_1 = JButton.new "Previous game"
	@button4_1.addActionListener do |e|
		@prev_game = find_prev_game @observes, @windows, 3
		@panel4.remove @browser4
        @game = Game.find(@observes[@prev_game].game_id)
        @game_pgn = PGNReader.new @game.pgn_file
  		@parsed_game = @game_pgn.parse_game
  		@browser4 = GameBrowser.new @parsed_game
  		@panel4.add @browser4, BorderLayout::CENTER
  		@panel4.revalidate
  		@panel4.repaint 
	
    end
    
    @button4_2 = JButton.new "Next game"
	@button4_2.addActionListener do |e|
		@next_game = find_next_game @observes, @windows, 3
		@panel4.remove @browser4
        @game = Game.find(@observes[@next_game].game_id)
        @game_pgn = PGNReader.new @game.pgn_file
  		@parsed_game = @game_pgn.parse_game
  		@browser4 = GameBrowser.new @parsed_game
  		@panel4.add @browser4, BorderLayout::CENTER
  		@panel4.revalidate
  		@panel4.repaint 
	
    end
    
    @panel_buttons_4 = JPanel.new

	@panel_buttons_4.add @button4_1
	@panel_buttons_4.add @button4_2
	@panel4.add @panel_buttons_4, BorderLayout::SOUTH
  	

  	@frame.set_layout GridLayout.new 2,2
  	
  	@frame.add @panel1
  	@frame.add @panel2
  	@frame.add @panel3
  	@frame.add @panel4
  	@frame.repaint
  	
  		
  	redirect_to_back root_path
  end	

  def update
  end

end
