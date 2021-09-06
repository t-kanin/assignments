require 'spec_helper'
require './support_service'

describe 'SupportService' do
  subject { instance.find }
  let(:agent1) { Agent.new('A', %w[English], 2) }
  let(:agent2) { Agent.new('B', %w[English Japanese]) }
  let(:ticket) { Ticket.new(1, %w[English]) }

  describe LeastLoadedAgent do
    describe '#solution' do
      context 'with given example' do
        let(:instance) { LeastLoadedAgent.new(ticket, [agent1, agent2]) }

        it 'returns agent B given restriction = [English]' do
          expect(subject).to be(agent2)
        end
      end

      context 'with new ticket' do
        let(:instance) { LeastLoadedAgent.new(Ticket.new(2, ['Thai']), [agent1, agent2]) }
        let(:agent3) { Agent.new('C', %w[Thai], 3) }

        it 'raises NoAgentFound' do
          expect { subject }.to raise_error('NoAgentFound')
        end

        it 'raises AgentsHaveTooMuchLoad' do
          instance.agents << agent3
          expect { subject }.to raise_error('AgentsHaveTooMuchLoad')
        end

        it 'returns agent C' do
          agent3.load = 0
          instance.agents << agent3
          expect(subject).to be(agent3)
        end
      end
    end
  end

  describe LeastFlexibleAgent do
    describe '#solution' do
      context 'with given example' do
        let(:instance) { LeastFlexibleAgent.new(ticket, [agent1, agent2]) }

        it 'returns agent A given restriction = [English]' do
          expect(subject).to be(agent1)
        end
      end

      context 'with new ticket' do
        let(:instance) { LeastFlexibleAgent.new(Ticket.new(2, ['Thai']), [agent1, agent2]) }

        it 'raises NoAgentFound' do
          expect { subject }.to raise_error('NoAgentFound')
        end
      end

      context 'with new ticket' do
        let(:instance) { LeastFlexibleAgent.new(Ticket.new(2, ['Thai']), [agent1, agent2]) }
        let(:agent3) { Agent.new('C', %w[Thai], 3) }

        it 'raises NoAgentFound' do
          expect { subject }.to raise_error('NoAgentFound')
        end

        it 'raises AgentsHaveTooMuchLoad' do
          instance.agents << agent3
          expect { subject }.to raise_error('AgentsHaveTooMuchLoad')
        end

        it 'returns agent C' do
          agent3.load = 0
          instance.agents << agent3
          expect(subject).to be(agent3)
        end
      end
    end
  end
end
