require 'spec_helper'
require './max_sibling'

describe MaxSibling do
  describe '#solution' do
    let(:instance) { described_class.new(321) }
    subject { instance.solution }

    context 'given example' do
      it 'should return 321 given 213' do
        expect(subject).to eq(321)
      end

      it 'should return 553 given 553' do
        instance.number = 553
        expect(subject).to eq(553)
      end
    end

    context 'given sample' do
      it 'should return 4321 given 1234' do
        instance.number = 1234
        expect(subject).to eq(4321)
      end

      it 'should return 1100 given 1001' do
        instance.number = 1001
        expect(subject).to eq(1100)
      end

      it 'should return 9987 given 9879' do
        instance.number = 9879
        expect(subject).to eq(9987)
      end
    end

    context 'given one digit' do
      it 'should return itself' do
        instance.number = 5
        expect(subject).to eq(instance.number)
      end
    end

    context 'given two digit' do
      it 'should return 54 given 45' do
        instance.number = 45
        expect(subject).to eq(54)
      end
    end

    context 'given large' do
      it 'should return 8765 given 5678' do
        instance.number = 5678
        expect(subject).to eq(8765)
      end
    end

    context 'given noting to change' do
      it 'should return itself' do
        instance.number = 4322
        expect(subject).to eq(4322)
      end
    end

    context 'given extreme large' do
      it 'should return 9998 given 9989' do
        instance.number = 9989
        expect(subject).to eq(9998)
      end
    end
  end
end
