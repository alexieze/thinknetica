array_numbers = (10..100).map do |i|
  i if (i % 5).zero? && (i % 5) != nil
end.compact

# 2 й способ
#array_numbers = (10..100).select {|i| i if (i % 5).zero?}.map { |i| i }

puts array_numbers.inspect

