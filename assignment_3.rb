def solution(a,b,c) 
  s = ''
  count = 0
  total = a + b + c 
  hash = { 'a'=> a, 'b'=> b, 'c'=> c}
  hash_sort = hash.sort_by { |k, v| -v}
  k_max, v_max = hash_sort.first 
  k_mid, v_mid = hash_sort[1]
  k_min, v_min = hash_sort.last

  for i in 0...total do 
    if count < 2 && v_max > 0 
      s += k_max
      v_max -= 1 
      count += 1 
    elsif v_mid > 0
      s += k_mid 
      v_mid -= 1 
      count = 0 
    elsif v_min > 0 
      s += k_min 
      v_min -= 1 
      count = 0 
    else 
      break 
    end  
  end 
  s
end 

p solution(6,1,1).size # expect size 8 got 8 
p solution(1,3,1).size # expect size 5 got 5  
p solution(0,1,8).size # expect size 5 got 5 
p solution(2,2,2).size # small size expect 6 got 6 

p solution(5,7,3) # wrong answer
