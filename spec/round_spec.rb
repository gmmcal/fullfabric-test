require 'spec_helper'

describe Round do

  subject do
    attacker = Player.new('attacker', 20)
    defender = Player.new('defender', 20)
    d1 = Die.new(10)
    d2 = Die.new(8)

    Round.new({
      id: 10,
      attacker: attacker,
      defender: defender,
      attack_die: d1,
      defense_die: d2
    })
  end

  it { expect(subject.attacker).to_not be_nil }
  it { expect(subject.defender).to_not be_nil }
  it { expect(subject.attack_die).to_not be_nil }
  it { expect(subject.defense_die).to_not be_nil }

  describe '.fight' do
    it 'attacker attacks using attack die' do
      expect(subject.attacker).to receive(:attack).with(subject.attack_die)
      subject.fight
    end

    it 'defender defends using defense die' do
      expect(subject.defender).to receive(:defend).with(subject.defense_die)
      subject.fight
    end
  end
end
