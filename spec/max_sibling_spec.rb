require 'spec_helper'
require './max_sibling'

describe MaxSibling do
  describe '#solution' do
    subject { instance.solution }
    
    let(:instance) { described_class.new(321) }

    context 'with example' do
      it 'returns 321 given 213' do
        expect(subject).to eq(321)
      end

      it 'returns 553 given 553' do
        instance.number = 553
        expect(subject).to eq(553)
      end
    end

    context 'with given sample' do
      it 'returns 4321 given 1234' do
        instance.number = 1234
        expect(subject).to eq(4321)
      end

      it 'returns 1100 given 1001' do
        instance.number = 1001
        expect(subject).to eq(1100)
      end

      it 'returns 9987 given 9879' do
        instance.number = 9879
        expect(subject).to eq(9987)
      end
    end

    context 'with one digit' do
      it 'returns itself' do
        instance.number = 5
        expect(subject).to eq(instance.number)
      end
    end

    context 'with two digit' do
      it 'returns 54 given 45' do
        instance.number = 45
        expect(subject).to eq(54)
      end
    end

    context 'with large number' do
      it 'returns 8765 given 5678' do
        instance.number = 5678
        expect(subject).to eq(8765)
      end
    end

    context 'with noting to change' do
      it 'returns itself' do
        instance.number = 4322
        expect(subject).to eq(instance.number)
      end
    end

    context 'with extreme large number' do
      it 'returns 9998 given 9989' do
        instance.number = 9989
        expect(subject).to eq(9998)
      end
    end
  end
end
