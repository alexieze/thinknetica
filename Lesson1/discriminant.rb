# Дискриминант

errors = {}


puts 'Введите переменную А:'
a = gets.chomp.to_f

puts 'Введите переменную B:'
b = gets.chomp.to_f

puts 'Введите переменную C:'
c = gets.chomp.to_f

if a <= 0
  errors[:a] = 'Значение переменной A не может быть пустым'
end

if b <= 0
  errors[:b] = 'Значение переменной B не может быть пустым'
end


if c <= 0
  errors[:c] = 'Значение переменной C не может быть пустым'
end


if !errors.empty?
  errors.each_value do |error_value|
    puts error_value
  end
else

  d = b**2 - 4 * a * c
  if d >= 0
    if d > 0
      x1 = (-b + Math.sqrt(d)) / 2 * a
      x2 = (-b - Math.sqrt(d)) / 2 * a
      puts "Дискриминант равен #{d}. Корень 1 равен - #{x1}. Корень 2 равен - #{x2}"
    else
      x1 = (-b / 2 * a)
      puts "Дискриминант равен #{d}, корень равен - #{x1}"
    end
  else
    puts "Дискриминант равен #{d},корней нет"
  end
end