require 'spec_helper'

describe Die do
  subject do
    described_class.new(5)
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
end
