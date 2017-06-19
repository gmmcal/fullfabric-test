require 'spec_helper'

describe Player do
  let(:name) { 'Name' }
  let(:life_points) { 20 }
  let(:player) { Player.new(name, life_points) }

  context 'valid' do
    it 'player to be created' do
      expect(player).to_not be_nil
    end

    it 'player name to be defined' do
      expect(player.name).to_not be_nil
    end

    it 'player life points to be defined' do
      expect(player.life_points).to_not be_nil
    end
  end

  context 'invalid' do
    let(:life_points) { -20 }

    it 'should raise an error' do
      expect{player}.to raise_error(StandardError)
    end
  end

  context 'attack' do
    let(:sides) { 10 }
    let(:die) { Die.new(sides) }
    let(:attack_point) { player.attack(die) }

    it 'should receive a die and return an attack point' do
      expect(attack_point).to be_a(Integer)
    end

    it 'attacks with a value greater than zero' do
      expect(attack_point).to be > 0
    end

    it 'attacks with a value less than the sides limit' do
      expect(attack_point).to be <= sides
    end

    it 'attacks with a random value' do
      allow(die).to receive(:roll) { 5 }
      expect(attack_point).to eq(5)
    end
  end

  context 'defend' do
    let(:sides) { 10 }
    let(:die) { Die.new(sides) }

    it 'defend to be an alias of attack' do
      expect(player.method(:defend)).to eq(player.method(:attack))
    end
  end

  context 'withdraw_damage!' do
    it 'should withdraw life points from player' do
      player.withdraw_damage!(5)
      expect(player.life_points).to eq(15)
    end
  end
end
