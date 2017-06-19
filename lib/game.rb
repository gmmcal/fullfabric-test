class Game
  attr_reader :player_1,
    :player_2,
    :attack_die,
    :defense_die

  def initialize( player_1:,
                  player_2:,
                  life_points:,
                  attack_die_sides:,
                  defense_die_sides:)
    @player_1 = Player.new(player_1, life_points)
    @player_2 = Player.new(player_2, life_points)
    @attack_die = Die.new(attack_die_sides)
    @defense_die = Die.new(defense_die_sides)
  end
end
