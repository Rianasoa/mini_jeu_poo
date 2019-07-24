require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts"                                 "
puts"          -----------            "
puts"   WELCOME TO TEXT BATTLE GAMES  "
puts"          -----------            "
puts"                                 "
puts"Entrez le nom du player1"
player1 = Player.new(gets.chomp.to_s)
puts"Entrez le nom du  player2"
player2 = Player.new(gets.chomp.to_s)
puts ""
puts"Voici l'etat de nos jouer"
puts"#{player1.show_state} #{player2.show_state}"
puts"Le jeux commence" 
puts"#{player2.attacks player1}"
while player1.life_player > 0 && player2.life_player > 0 
	 player1.attacks(player2)
	if player1.life_player <= 0	
		break 
	end 	 
	player2.attacks(player1)
	if player2.life_player <= 0 
		break
	end
	puts"#{player1.show_state} #{player2.show_state}"
end
