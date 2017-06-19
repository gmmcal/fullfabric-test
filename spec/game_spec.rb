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

  context '.play' do

    it 'plays a round which kills player_2' do
      allow(subject.attack_die).to receive(:roll) { 21 }
      allow(subject.defense_die).to receive(:roll) { 1 }

      subject.play!

      expect(subject.winner).to eq(subject.player_1)
    end

    it 'plays 2 rounds which kills player_1' do
      allow(subject.attack_die).to receive(:roll).and_return(11, 21)
      allow(subject.defense_die).to receive(:roll) { 1 }

      subject.play!

      expect(subject.winner).to eq(subject.player_2)
    end

    it 'plays 3 rounds which kills player_2' do
      allow(subject.attack_die).to receive(:roll).and_return(11, 11, 11)
      allow(subject.defense_die).to receive(:roll) { 1 }

      subject.play!

      expect(subject.winner).to eq(subject.player_1)
    end

  end
end
