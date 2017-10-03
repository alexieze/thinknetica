
errors = {}

puts 'Введите сторону А:'
a = gets.chomp.to_f

puts 'Введите сторону B:'
b = gets.chomp.to_f

puts 'Введите сторону C:'
c = gets.chomp.to_f

if a <= 0
  errors[:a] = 'Значение стороны A не может быть пустым'
end

if b <= 0
  errors[:b] = 'Значение стороны B не может быть пустым'
end


if c <= 0
  errors[:c] = 'Значение стороны C не может быть пустым'
end

if !errors.empty?
  errors.each_value do |error_value|
    puts error_value
  end
else
  if c == b || b == a || a == c
    puts 'Треугольник является равнобедренным'
  elsif c ** 2 == (a**2 + b**2) || a**2 == (b**2 + c**2) || b**2 == (a**2 + b**2)
    puts 'Треугольник является прямоугольным'
  else
    puts 'Треугольник не равнобедренный и не прямоугольный'
  end
end