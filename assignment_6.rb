def solution(s,c) 
  sum = 0
  s_arr = s.chars 
  
  for i in 1...s_arr.length
    next unless s[i-1].eql?(s[i])

    if(c[i-1] < c[i])
      sum += c[i-1]
    else 
      sum += c[i]
      c[i] = c[i-1]
    end 
  end 
  sum  
end 

p solution("abccbb", [1,2,3,4,5,6]) #expect 8 got 8
p solution("aabbcc", [1,2,1,2,1,2]) #expect 3 got 3 
p solution("aaaa", [3,4,5,6]) #expect 12 got 12
p solution("ababa", [10,5,10,5,10]) # expect 0 got 0
p solution("aaabbbabbbb",[3,5,10,7,5,3,5,5,4,8,1]) #expect 26 got 26 

