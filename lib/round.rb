class Round
  attr_reader :id,
    :attacker,
    :defender,
    :attack_die,
    :defense_die

  def initialize( id: id,
                  attacker: attacker,
                  defender: defender,
                  attack_die: attack_die,
                  defense_die: defense_die)
    @id = id
    @attacker = attacker
    @defender = defender
    @attack_die = attack_die
    @defense_die = defense_die
  end
end