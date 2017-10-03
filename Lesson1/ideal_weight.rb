# Задача: Вычислить идеальный вес

delta = 110

puts 'Введите свое имя:'
user_name = gets.chomp.to_s.capitalize

puts 'Введите свой рост:'
user_height = gets.chomp.to_i

user_ideal_width = user_height - delta
if user_ideal_width >= 0
  puts "#{user_name}, Ваш идеальный вес #{user_ideal_width} кг."
else
  puts 'Ваш вес уже оптимальный'
end
