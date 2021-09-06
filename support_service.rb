class Ticket
  attr_reader :id, :restrictions

  def initialize(id, restrictions)
    @id = id
    @restrictions = restrictions
  end

  def print
    puts "Ticket #{id}: require #{restrictions}"
  end
end

class Agent
  attr_reader :name, :skills, :load

  def initialize(name, skills, load = 0)
    @name = name
    @skills = skills
    @load = load
  end

  def print
    puts "Agent #{name} has #{skills} skills and processes #{load} tickets "
  end

  def print_available(ticket_id)
    @load += 1
    puts "Agent #{name} has taken ticket number: #{ticket_id}"
  end
end

class LeastLoadedAgent
  def find(ticket, agents)
    agents.select { |agent| (ticket.restrictions - agent.skills).empty? }
    raise 'NoAgentFound' if agents.empty?

    agents.select! { |agent| agent.load < 3 }
    raise 'AgentsHaveTooMuchLoad' if agents.empty?

    agents.sort_by!(&:load).first
  end
end

class LeastFlexibleAgent
  def find(ticket, agents)
    agents.select! { |agent| (ticket.restrictions - agent.skills).empty? }
    raise 'NoAgentFound' if agents.empty?

    agents.select! { |agent| agent.load < 3 }
    raise 'AgentsHaveTooMuchLoad' if agents.empty?

    agents.sort_by!(&:skills).first
  end
end
