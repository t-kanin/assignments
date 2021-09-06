require 'spec_helper'
require './diverse_Word'

describe DiverseWord do
  describe '#solution' do
    subject { instance.solution }

    context 'with first example' do
      let(:instance) { described_class.new(6, 1, 1) }

      it 'returns aabaacaa given A = 6 B = 1 C = 1' do
        expect(subject).to match('aabaacaa')
      end
    end

    context 'with second example' do
      let(:instance) { described_class.new(1, 3, 1) }

      it 'returns bbabc given A = 1 B = 3 C = 1' do
        expect(subject).to match('bbabc')
      end
    end

    context 'with third example' do
      let(:instance) { described_class.new(0, 1, 8) }

      it 'returns ccbcc given A = 0 B = 1 C = 8' do
        expect(subject).to match('ccbcc')
      end
    end

    context 'with small size <= 2' do
      let(:instance) { described_class.new(2, 2, 2) }

      it 'returns aabbcc given A = 2 B = 2 C = 2' do
        expect(subject).to match('aabbcc')
      end
    end
  end
end
