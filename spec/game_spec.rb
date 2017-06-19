require 'spec_helper'

describe Game do
  subject do
    Game.new( player_1: 'Player 1',
              player_2: 'Player 2',
              life_points: 20,
              attack_die_sides: 10,
              defense_die_sides: 8)
  end

  it { expect(subject.player_1).to_not be_nil }
  it { expect(subject.player_2).to_not be_nil }
  it { expect(subject.attack_die).to_not be_nil }
  it { expect(subject.defense_die).to_not be_nil }
end
