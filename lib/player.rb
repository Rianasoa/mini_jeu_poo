class Player #définition de la méthode classe avec attribut read et write  
  attr_accessor :name, :life_player
  

  def initialize(name) #la méthode initialise les variables d'instances nom et nombre de points de vie
    @name = name
    @life_player = 10
  end

  def show_state #la méthode montre l'état du joueur
    return "#{@name} a #{@life_player} points de vie"
  end

  def gets_damage(damaged_received) # la méthode défini le nombre de coups reçus
    @life_player -= damaged_received

        if @life_player <= 0
          puts "le joueur #{@name} a été tué !"
        end
  end

  def attacks(player) #la méthode d'attaque du joueur 1 sur le joueur 2
    puts "le joueur #{@name} attaque le joueur #{player.name}"
    damage = compute_damage
    puts "il lui inflige #{damage} points de dommages"
    player.gets_damage(damage)
  end

  def compute_damage # méthode roulette pour définir le nombre de dommages effectués à chaque lancé
    return rand(1..6)
  end

end


class HumanPlayer < Player
    attr_accessor :weapon_level

  def initialize(name)
    super(name)
      @life_player = 100
      @weapon_level = 1
    end

  def show_state
    return "#{@name} a #{@life_player} points de vie et une arme de niveau #{weapon_level}"
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon
    weapon_level_new = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{weapon_level_new}"

    if weapon_level_new > @weapon_level
      @weapon_level = weapon_level_new
      puts "YOUHOU ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "DAMN IT... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    health_pack = rand(1..6)

    if health_pack == 1
      puts "Tu n'as rien trouvé... "
    elsif health_pack.between?(2, 5)
      @life_player += 50
      puts "Bravo, tu as trouvé un pack de +50 points de vie !"
    elsif
      @life_player += 80
      puts "Waow, tu as trouvé un pack de +80 points de vie !"
    end

    if @life_player > 100
      @life_playerr = 100
    end
  end
end
