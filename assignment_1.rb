def solution(number) 
	arr = []
  return number if number < 10

	while number != 0 do 
    arr << number%10 
		number = number/10 
	end 

	arr_sort = arr.sort.reverse
	arr_sort.join.to_i
end 

#test 4 digits
p test1 = solution(9687) #expect 9876 got 9876
p test2 = solution(2000) #expect 2000 got 2000
p test3 = solution(5445) #expect 5544 got 5544

# test 1 digit 
p test4 = solution(3) #expect 3 got 3 
p test0 = solution(0) #expect 0 got 0 

# test 2 digits
p test5 = solution(45) # expect 54 got 54
