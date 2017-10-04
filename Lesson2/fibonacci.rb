def fibonacci(n)
  fibonacci_array = [1, 1]
  i = 2
  while i <= n do
    number = (fibonacci_array[i - 1] + fibonacci_array[i - 2]).to_i
    fibonacci_array.push(number)
    i += 1
  end
  return fibonacci_array
end
puts fibonacci(10).inspect