# Дискриминант

puts 'Введите переменную А:'
a = gets.chomp.to_f

puts 'Введите переменную B:'
b = gets.chomp.to_f

puts 'Введите переменную C:'
c = gets.chomp.to_f

d = b**2 - 4 * a * c

if d > 0
  square_discriminant = Math.sqrt(d);
  x1 = (-b + square_discriminant) / (2 * a)
  x2 = (-b - square_discriminant) / (2 * a)
  puts "Дискриминант равен #{d}. Корень 1 равен - #{x1}. Корень 2 равен - #{x2}"
elsif d == 0
  x1 = (-b / 2 * a)
  puts "Дискриминант равен #{d}, корень равен - #{x1}"
else
  puts "Дискриминант равен #{d},корней нет"
end