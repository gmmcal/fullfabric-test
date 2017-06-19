require 'spec_helper'

describe Round do

  it 'takes 2 players, 2 dice' do

    attacker = double('attacker')
    defender = double('defender')
    d1 = double('d1')
    d2 = double('d2')

    round = Round.new({
      id: 10,
      attacker: attacker,
      defender: defender,
      attack_die: d1,
      defense_die: d2
    })

    expect(round.attacker).to_not be_nil
    expect(round.defender).to_not be_nil
    expect(round.attack_die).to_not be_nil
    expect(round.defense_die).to_not be_nil
  end

end