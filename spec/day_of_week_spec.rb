require 'spec_helper'
require './day_of_week'

describe DayOfWeek do
  describe '#solution' do
    subject { instance.solution }

    context 'with first example' do
      let(:instance) { described_class.new('Wed', 2) }

      it 'returns Fri given s = Wed and k = 2' do
        expect(subject).to match('Fri')
      end
    end

    context 'with second example' do
      let(:instance) { described_class.new('Sat', 23) }

      it 'returns Mon given s = Sat and k = 23' do
        expect(subject).to match('Mon')
      end
    end

    context 'with samll k where k < 7' do
      let(:instance) { described_class.new('Wed', 0) }

      it 'returns itself when k = 0' do
        expect(subject).to match('Wed')
      end

      it 'returns Wed when k = 2' do
        instance.k = 2
        expect(subject).to match('Fri')
      end
    end

    context 'with next week where k < 7' do
      let(:instance) { described_class.new('Sun', 3) }

      it 'returns Wed given s = Sun and k = 3' do
        expect(subject).to match('Wed')
      end
    end

    context 'with Big where k >= 7' do
      let(:instance) { described_class.new('Wed', 500) }

      it 'returns Sat given s = Wed and k = 500' do
        expect(subject).to match('Sat')
      end
    end
  end
end
