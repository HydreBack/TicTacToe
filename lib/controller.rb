class Controller

attr_accessor :id_game

def initialize
	@view = View.new
	create_new_game
end

def create_new_game
	players = @view.create_new_game
	@id_game = Model.new(players)
	@game_hash = @id_game.create_new_game
	
	while true 
		#|| !draw
		@view.display_board(@id_game.game_hash)
		turn
		system "clear"
		if @id_game.victory
			@view.display_board(@id_game.game_hash)
			puts " you wiiin !!!"
			puts "appuyer sur une touche pour continuer"
			gets.chomp
			break
		elsif @id_game.draw
			puts "égalité !"
			puts "appuyer sur une touche pour rejouer"
			break
		end
	end
end

def turn 

	if @id_game.player1.your_turn? 
		choice = @view.your_turn(@id_game.player1.name, @game_hash)
		if @game_hash[choice] == nil
			@id_game.modify(choice, "j1")
		else
			@id_game.player1.your_turn? 
			turn
		end
		
	else 
		choice = @view.your_turn(@id_game.player2.name, @game_hash)
		
		if @game_hash[choice] == nil
			@id_game.modify(choice, "j2")
		else
			@id_game.player1.your_turn? 
			turn
		end
	end
end

end