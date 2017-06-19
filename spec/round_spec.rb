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
    it 'when attack points is greater than defense points, applies damage to defender' do
      allow(subject.attacker).to receive(:attack) { 10 }
      allow(subject.defender).to receive(:defend) { 5 }
      expect(subject.defender).to receive(:withdraw_damage!).with(5)
      subject.fight
    end

    it 'when defense points is greater than attack points, no damage is applied' do
      allow(subject.attacker).to receive(:attack) { 5 }
      allow(subject.defender).to receive(:defend) { 10 }
      expect(subject.defender).to_not receive(:withdraw_damage!)
      subject.fight
    end
  end
end
