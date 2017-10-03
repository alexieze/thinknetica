
puts 'Введите сторону А:'
a = gets.chomp.to_f

puts 'Введите сторону B:'
b = gets.chomp.to_f

puts 'Введите сторону C:'
c = gets.chomp.to_f

sides_triangle = [a, b, c]
hypotenuse = sides_triangle.max
sides_triangle.delete(hypotenuse)
side_c, side_b = sides_triangle

if c == b && b == a && a == c
  puts 'Треугольник является равносторонним'
elsif hypotenuse**2 == side_c**2 + side_b**2
  puts 'Треугольник является прямоугольным'
elsif c == b || b == a || a == c
  puts 'Треугольник является равнобедренным'
else
  puts 'Треугольник не равнобедренный и не прямоугольный'
end
