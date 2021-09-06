require 'spec_helper'
require './diverse_Word'

describe DiverseWord do 
  describe '#solution' do
    let(:instance) { described_class.new }

    context 'given example' do
      it 'should return aabaacaa given A = 6 B = 1 C = 1' do
        subject = instance.solution(6, 1, 1)
        expect(subject).to match('aabaacaa')
      end

      it 'should return bbabc given A = 1 B = 3 C = 1' do
        subject = instance.solution(1, 3, 1)
        expect(subject).to match('bbabc')
      end

      it 'should return ccbcc given A = 0 B = 1 C = 8' do
        subject = instance.solution(0, 1, 8)
        expect(subject).to match('ccbcc')
      end
    end

    context 'small size <= 2' do
      it 'should return aabbcc given A = 2 B = 2 C = 2' do
        subject = instance.solution(2, 2, 2)
        expect(subject).to match('aabbcc')
      end
    end
  end
end
