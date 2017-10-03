# Площадь треугольника

errors = {}

puts 'Введите основание треугольника:'
a = gets.chomp.to_f

puts 'Введите высоту треугольника:'
h = gets.chomp.to_f

if a <= 0
  errors[:a] = 'Значение основание треугольника не может быть равным нулю'
end

if h <= 0
  errors[:h] = 'Высота треугольника не может быть равной нулю'
end


if !errors.empty?
  errors.each_value do |error_value|
    puts error_value
  end
else
  s = a * h / 2
  puts "Площадь треугольника равна #{s}"
end