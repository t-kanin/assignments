class MaxSibling
  attr_accessor :number

  def initialize(number)
    @number = number
  end

  def solution
    return number if number < 10

    find_max(number)
  end

  private

  def find_max(number)
    arr = []
    loop do
      break if number.zero?

      arr << number % 10
      number /= 10
    end
    arr.sort.reverse.join.to_i
  end
end
