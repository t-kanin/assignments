def solution(number)
  arr = []
  return number if number < 10

  loop do
    arr << number % 10
    number /= 10
    break if number.zero?
  end

  arr.sort.reverse.join.to_i
end

# test 4 digits
p solution(9687) # expect 9876 got 9876
p solution(2000) # expect 2000 got 2000
p solution(5445) # expect 5544 got 5544

p solution(3) # expect 3 got 3
p solution(0) # expect 0 got 0

# test 2 digits
p solution(45) # expect 54 got 54
