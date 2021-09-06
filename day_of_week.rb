class DayOfWeek
  DAYS = %w[Mon Tue Wed Thu Fri Sat Sun].freeze
  def solution(day, k)
    index = DAYS.index(day)
    index = (index + k) % 7
    DAYS[index]
  end
end
