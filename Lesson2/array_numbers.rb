array_numbers = (10..100).to_a.map do |i|
  if (i % 5).zero?
    i
  end
end
puts array_numbers.compact.inspect

