require 'player'

class Model

attr_accessor :game_hash, :player1, :player2

def initialize(players)
	@player1 = Player.new(players[0], true)
	@player2 = Player.new(players[1], false)
	
end

def create_new_game
	return @game_hash = { "a1" => nil, "a2" => nil, "a3" => nil, "b1" => nil, "b2" => nil, "b3" => nil, "c1" => nil, "c2" => nil, "c3" => nil }
end


def save(game_hash)
    File.open("./content_game.JSON","w") do |f|
      f << game_hash.to_json
     end
end

def modify(turn, turn_player)
	@game_hash[turn] = turn_player
	self.save(@game_hash)
end

def victory
	if (@game_hash["a1"] == @game_hash["a2"]) && (@game_hash["a1"] == @game_hash["a3"]) && @game_hash["a1"] != nil
		return true 
	elsif (@game_hash["b1"] == @game_hash["b2"]) && (@game_hash["b1"] == @game_hash["b3"]) && @game_hash["b3"] != nil
		return true 
	elsif (@game_hash["c1"] == @game_hash["c2"]) && (@game_hash["c1"] == @game_hash["c3"]) && @game_hash["c3"] != nil
		return true 
	elsif (@game_hash["a1"] == @game_hash["b1"]) && (@game_hash["a1"] == @game_hash["c1"]) && @game_hash["c1"] != nil
		return true 
	elsif (@game_hash["a2"] == @game_hash["b2"]) && (@game_hash["a2"] == @game_hash["c2"]) && @game_hash["c2"] != nil
		return true 
	elsif (@game_hash["a3"] == @game_hash["b3"]) && (@game_hash["a3"] == @game_hash["c3"]) && @game_hash["c3"] != nil
		return true 
	elsif (@game_hash["a1"] == @game_hash["b2"])&& (@game_hash["a1"] == @game_hash["c3"]) && @game_hash["c3"] != nil
		return true 
	elsif (@game_hash["a3"] == @game_hash["b2"]) && (@game_hash["a3"] == @game_hash["c1"]) && @game_hash["c1"] != nil
		return true 
	else 
		return false
	end
end

def draw 
	if @game_hash["a1"] != nil && @game_hash["a2"] != nil && @game_hash["a3"] != nil && @game_hash["b1"] != nil && @game_hash["b2"] != nil && @game_hash["b3"] != nil && @game_hash["c1"] != nil && @game_hash["c2"] != nil && @game_hash["c3"] != nil 
		return true 
	end 

end
end
