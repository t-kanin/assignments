class AgentNotFoundException < StandardError 
  
end 

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
  def find(ticket,agents)  # ticket.restrictions - agent.skills
    available_agents = agents.select { |agent| agent.skills.include?(ticket.restrictions) && agent.load < 3 } # common method
    return  puts "No agent available" if available_agents.empty?

    available_agents.sort_by!(&:load)
    available_agents.first.print_available(ticket.id)
  end 
end 

class LeastFlexibleAgent 
  def find(ticket,agents)
    available_agents = agents.select { |agent| agent.skills.include?(ticket.restrictions) && agent.load < 3 }
    return  puts "No agent available" if available_agents.empty? 

    available_agents.sort_by!(&:skills)
    available_agents.first.print_available(ticket.id) 
  end 
end 

def break_point
  50.times { print "-" }
  puts ''
end

# create tickets and agents
tickets = [] 
agents = []
ticket = Ticket.new(1, %w[English])
tickets << ticket
agent1 = Agent.new("A", %w[English], 2)
agents << agent1
agent2 = Agent.new("B", %w[English Japanese])
agents << agent2 
agent3 = Agent.new("C", %w[History Thai], 3)
agents << agent3
#print tickets and agents info 
puts "Tickets:"
tickets.each { |ticket| ticket.print }
break_point
puts "Agents:"
agents.each { |agent| agent.print }
break_point

#test 
puts "Least loaded policy: "
least_loaded_policy = LeastLoadedAgent.new
least_loaded_policy.find(tickets[0], agents)  #expect agent B to take the job get agent B 
break_point

puts "Least flexible policy: "
least_flexible_policy = LeastFlexibleAgent.new
least_flexible_policy.find(tickets[0], agents) #expect agent A to take the job got agent A 
break_point
puts "Expect no agent:"
ticket2 = Ticket.new(2, %w[History Thai]) 
tickets << ticket2
least_loaded_policy.find(tickets[1], agents)  # expect no agent 
least_flexible_policy.find(tickets[1], agents) # expect no agent 
