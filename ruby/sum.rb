sum = 0
for i in 1..999 do
  if i%3==0 || i%5==0
    sum += i
  end
end
puts sum
# => 233168