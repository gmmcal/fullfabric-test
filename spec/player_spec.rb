require 'spec_helper'

describe Player do
  let(:player) { Player.new(name, life_points) }

  context 'valid' do
    let(:name) { 'Name' }
    let(:life_points) { 20 }
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
    let(:name) { 'Name' }
    let(:life_points) { -20 }

    it 'should raise an error' do
      expect{player}.to raise_error(StandardError)
    end
  end
end
