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
    let(:die) { double('die', value: 10) }

    it 'should receive a die and return an attack point' do
      attack_point = player.attack(die)
      expect(attack_point).to be_a(Integer)
    end

    it 'attacks with a value greater than zero' do
      attack_point = player.attack(die)
      expect(attack_point).to be > 0
    end

    it 'attacks with a value less than the die value' do

    end
  end
end
