require 'spec_helper'
require './day_of_week'

describe DayOfWeek do
  describe '#solution' do
    let(:instance) { described_class.new }

    context 'given example' do
      it 'should return Fri given s = Wed and k = 2' do
        subject = instance.solution('Wed', 2)
        expect(subject).to match('Fri')
      end

      it 'should return Mon given s = Sat and k = 23' do
        subject = instance.solution('Sat', 23)
        expect(subject).to match('Mon')
      end
    end

    context 'given same day' do
      it 'should return itself' do
        subject = instance.solution('Mon', 0)
        expect(subject).to match('Mon')
      end
    end

    context 'given same week' do
      it 'should return Wed given s = Mon and k = 2' do
        subject = instance.solution('Mon', 2)
        expect(subject).to match('Wed')
      end
    end

    context 'given next week k < 7' do
      it 'should return Wed given s = Sun and k = 3' do
        subject = instance.solution('Sun', 3)
        expect(subject).to match('Wed')
      end
    end

    context 'given Big k >= 7' do
      it 'should return Sat given s = Wed and k = 500' do
        subject = instance.solution('Wed', 500)
        expect(subject).to match('Sat')
      end
    end
  end
end
