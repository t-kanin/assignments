class DayOfWeek
  attr_accessor :day, :k

  DAYS = %w[Mon Tue Wed Thu Fri Sat Sun].freeze

  def initialize(day, k)
    @day = day
    @k = k
  end

  def solution
    index = DAYS.index(day)
    index = (index + k) % 7
    DAYS[index]
  end
end
