class Player

	attr_accessor :name, :life_points

	def initialize(name_player)
		@name = name_player
		@life_points = 10
	end

	def show_state
		if @life_points < 0
			@life_points = 0
		end
		puts "#{@name} a #{@life_points} de vie"

	end

	def gets_damage(n_damage)

		@life_points = @life_points - n_damage.to_i

		if @life_points <= 0
			puts "le joueur #{@name} a été tué"
		else
			return show_state
		end

	end

	def attacks(player2)
		puts "le joueur #{@name} attaque le joueur #{player2.name}"

		round = compute_damage

		puts "#{name} lui inflige #{round} points de dommages"

		player2.gets_damage(round)
		
	end

	def compute_damage
    	return rand(1..6)
  	end

end

class HumanPlayer < Player

	attr_accessor :weapon_level

	def initialize(name_player)

		super(name_player)
		@life_points = 100
		@weapon_level = 1

	end

	def show_state
		if @life_points < 0
			@life_points = 0
		end
		puts "#{@name} a #{@life_points} de vie et une arme de vie #{@weapon_level}"	

	end

	def compute_damage
    	rand(1..6) * @weapon_level
  	end

  	def search_weapon

  		weapon_level_new = rand(1..6)
  		puts "Tu as trouvé une arme de niveau #{weapon_level_new}"

  		if weapon_level_new > @weapon_level
  			@weapon_level = weapon_level_new
  			puts "Youhou! elle est meilleure que ton arme actuelle: tu la prends."
  		elsif weapon_level_new <= weapon_level
  			puts "M@*#$... elle n'est pas mieux que ton arme actuelle.."
  			
  		end
  	end

  	def search_health_pack
  		health_pack = rand(1..6)

  		if health_pack == 1
  			puts "Tu n'as rien trouvé"
  		 elsif health_pack.between?(2, 5)
      		@life_points += 50
      		puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    	elsif health_pack == 6
      		@life_points += 80
      		puts "Waow, tu as trouvé un pack de +80 points de vie !"
    	end

    	if @life_points > 100
      		@life_points = 100
    	end
  	end
  			
  	

end