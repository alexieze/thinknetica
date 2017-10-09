fibonacci_array = [1, 1]
while true do
  number = (fibonacci_array[-1] + fibonacci_array[-2])
  break if number >= 100
  fibonacci_array << number
end

puts fibonacci_array.inspect
