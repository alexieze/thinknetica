array_numbers = (10..100).map do |i|
  i if (i % 5).zero?
end
puts array_numbers.inspect

