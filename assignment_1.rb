def solution(number) 
  arr = []
  return arr << number if number < 10

  while number != 0 do 
    arr << number % 10 
    number = number / 10 
  end 

  arr = arr.sort.reverse
  res = arr.join.to_i
  res
end 

#test 4 digits
p test1 = solution(9687) 
p test2 = solution(2000)
p test3 = solution(5445)

# test 1 digit 
p test4 = solution(3)
p test0 = solution(0) 

# test 2 digits
p test5 = solution(45)






