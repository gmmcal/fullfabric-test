class Game
  attr_reader :player_1,
    :player_2,
    :attack_die,
    :defense_die,
    :winner

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

  def play!
    attacker = @player_1
    defender = @player_2

    while @winner.nil? do

      round = Round.new(
        id: 1,
        attacker: attacker,
        defender: defender,
        attack_die: @attack_die,
        defense_die: @defense_die
      )

      round.fight

      if defender.life_points <= 0
        @winner = attacker
      else
        temp = attacker
        attacker = defender
        defender = temp
      end

    end
  end
end
