class DayOfWeek
  def solution(day, k)
    days = %w[Mon Tue Wed Thu Fri Sat Sun]
    days.freeze
    index = days.index(day)
    index = (index + k) % 7
    days[index]
  end
end
