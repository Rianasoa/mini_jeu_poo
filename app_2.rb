require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "------------------------------------------------"

puts "Quel est le nom de ton joueur ?"
player3 = HumanPlayer.new(gets.chomp.to_s)


player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2] 
user = player3


while user.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
    puts "Voici l'état de santé de ton joueur #{user.name} :"
    puts "#{user.show_state}"
    puts ""

    puts "Que veux-tu faire ?"
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts ""

    puts "Attaquer un autre joueur :"

    puts "0 - #{player1.name} -> #{player1.show_state} points de vie"
    puts ""
    puts "1 - #{player2.name} -> #{player2.show_state} points de vie"
    puts ""

    user_choice = gets.chomp
    if user_choice == "a"
        user.search_weapon
    elsif user_choice == "s"
        user.search_health_pack
    elsif user_choice == "0"
        user.attacks(player1)
    elsif user_choice == "1"
        user.attacks(player2)
    else
        puts "Choix non valide !"
    end
    puts ""
    # .all? vérifie si la condition est vraie pour TOUS les éléments de l'array
    # si oui, cela nous sort de la boucle
    break if enemies.all? { |enemie| enemie.life_points <= 0 }
	puts "Les autres joueurs attaquent !"
    enemies.each do |enemie|
    	enemie.attacks(user) if user.life_points > 0 && enemie.life_points > 0 
    end
end

if player3.life_points > 0 
	puts "La partie est finie"
	puts "WAOUHHHH Tu As Fait un bon MATCH !"
else
	puts "OUHHH ! Tu as perdu !"
end