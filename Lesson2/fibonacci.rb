def fibonacci(n)
  fibonacci_array = [1, 1]
  i = 2
  while i <= n do
    number = (fibonacci_array[i - 1] + fibonacci_array[i - 2])
    break if number >= 100
    fibonacci_array << number
    i += 1
  end
  return fibonacci_array
end
puts fibonacci(100).inspect