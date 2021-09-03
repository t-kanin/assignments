DAYS = %w[Mon Tue Wed Thu Fri Sat Sun]
def solution(day, k)
  index = DAYS.index(day)
  index = (index + k)%7 
  DAYS[index]  
end 

p solution('Wed',4) #expect Sun get Sun
p solution('Wed',500) #expect Sat get Sat
p solution('Sat',23) # expect Mon get Mon
