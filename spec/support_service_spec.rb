require 'spec_helper'
require './support_service'

describe 'SupportService' do
  let(:agent1) { Agent.new('A', %w[English], 2) }
  let(:agent2) { Agent.new('B', %w[English Japanese]) }
  let(:ticket) { Ticket.new(1, %w[English]) }

  describe LeastLoadedAgent do
    describe '#solution' do
      let(:instance) { described_class.new }

      context 'given example' do
        it 'should return agent B given restriction = [English]' do
          subject = instance.find(ticket, [agent1, agent2])
          expect(subject).to eq(agent2)
        end
      end
    end
  end

  describe LeastFlexibleAgent do
    describe '#solution' do
      let(:instance) { described_class.new }

      context 'given example' do
        it 'should return agent A given restriction = [English]' do
          subject = instance.find(ticket, [agent1, agent2])
          expect(subject).to eq(agent1)
        end
      end
    end
  end
end
