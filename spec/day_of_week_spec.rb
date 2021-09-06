require 'spec_helper'
require './day_of_week'

describe DayOfWeek do
  describe '#solution' do
    subject { instance.solution }
    let(:instance) { described_class.new('Wed', 2) }

    context 'with given example' do
      it 'returns Fri given s = Wed and k = 2' do
        expect(subject).to match('Fri')
      end

      it 'returns Mon given s = Sat and k = 23' do
        instance.day = 'Sat'
        instance.k = 23
        expect(subject).to match('Mon')
      end
    end

    context 'with same day' do
      it 'returns itself' do
        instance.day = 'Mon'
        instance.k = 0
        expect(subject).to match('Mon')
      end
    end

    context 'within same week' do
      it 'returns Wed given s = Mon and k = 2' do
        instance.day = 'Mon'
        instance.k = 2
        expect(subject).to match('Wed')
      end
    end

    context 'with next week where k < 7' do
      it 'returns Wed given s = Sun and k = 3' do
        instance.day = 'Sun'
        instance.k = 3
        expect(subject).to match('Wed')
      end
    end

    context 'with Big where k >= 7' do
      it 'returns Sat given s = Wed and k = 500' do
        instance.day = 'Wed'
        instance.k = 500
        expect(subject).to match('Sat')
      end
    end
  end
end
