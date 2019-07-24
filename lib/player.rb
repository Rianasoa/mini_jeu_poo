class Player
	attr_accessor :name,:life_player

 	def initialize(name_player)
 	@name = name_player
 	@life_player = 10
 	end
 	def show_state
puts "#{@name} à #{@life_player} points de vie"
 	end

 	def gets_damage(felaka_be)

 	@life_player = @life_player - felaka_be.to_i 
 		if @life_player <=0
 			puts "Il est mort"
 		else
 			
 		end	
 	end
 	def compute_damage
 		return rand(1..6)
 	end
 	def attacks(player2)
 		puts "#{@name} attaque #{player2.name}"
 		coup =compute_damage 
 		puts "Il lui influge #{coup} points de dommages"
 		player2.gets_damage(coup)
 	end
end
