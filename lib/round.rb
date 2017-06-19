class Round
  attr_reader :id,
    :attacker,
    :defender,
    :attack_die,
    :defense_die

  def initialize(id:, attacker:, defender:, attack_die:, defense_die:)
    @id = id
    @attacker = attacker
    @defender = defender
    @attack_die = attack_die
    @defense_die = defense_die
  end

  def fight
    attack_points = attacker.attack(attack_die)
    defense_points = defender.defend(defense_die)
    defender.withdraw_damage!(attack_points - defense_points) if attack_points > defense_points
  end
end
