# lignes très pratiques qui appellent les gems du Gemfile. On verra plus tard comment s'en servir ;) - ça évite juste les "require" partout
require 'bundler'
Bundler.require

# lignes qui appellent les fichiers lib/user.rb et lib/event.rb
# comme ça, tu peux faire User.new dans ce fichier d'application. Top.
require_relative 'lib/player'
require_relative 'lib/game'

player1 = Player.new("Josiane")
player2 = Player.new("José")

puts "Voici l'état de nos joueurs :"
puts "#{player1.show_state} #{player2.show_state}"

puts "Passons à la phase de l'attaque :"
puts "#{player1.attacks(player2)} #{player2.attacks(player1)}"


while player1.life_points > 0 && player1.life_points > 0

		player1.attacks(player2) 

		if player2.life_points <= 0
			break
		end
		player2.attacks(player1) 
		
		if player1.life_points <= 0
			break
		end
			
		puts "Voici l'état de nos joueurs :"
		puts "#{player1.show_state} #{player2.show_state}"

end



# Maintenant c'est open bar pour tester ton application. Tous les fichiers importants sont chargés
# Tu peux faire User.new, Event.new, binding.pry, User.all, etc.
