require 'spec_helper'

describe Die do
  let(:sides) { 5 }
  subject do
    described_class.new(sides)
  end

  context 'valid' do
    it 'sides to be greater than zero' do
      expect(subject.sides).to be > 0
    end
  end

  context 'invalid' do
    it 'raises error when sides is zero' do
      expect { described_class.new(0) }.to raise_error(StandardError)
    end

    it 'raises error when sides is less than zero' do
      expect { described_class.new(-1) }.to raise_error(StandardError)
    end
  end

  context '.roll' do
    it 'should return a number' do
      expect(subject.roll).to be_a(Integer)
    end

    it 'should return a value greater than zero' do
      expect(subject.roll).to be > 0
    end

    it 'should return a value less than the sides' do
      expect(subject.roll).to be <= sides
    end
  end
end
