# Задача: Вычислить идеальный вес

errors = {}
delta = 110

puts 'Введите свое имя:'
user_name = gets.chomp.to_s.capitalize

puts 'Введите свой рост:'
user_height = gets.chomp.to_i

if user_name == ''
  errors[:emptyName] = 'Имя пользователя не может быть пустым'
end

if user_height <= 0
  errors[:zeroHeight] = 'Рост не может быть пустым или быть равным нулю'
end

if errors.length > 0
  errors.each do |error_key,error_value|
    puts error_value
  end
else
  user_ideal_width = user_height - delta
  if user_ideal_width >= 0
    puts "#{user_name}, Ваш идеальный вес #{user_ideal_width} кг."
  else
    puts 'Ваш вес уже оптимальный'
  end
end
