puts 'Введите день:'
day = gets.chomp.to_i
puts 'Введите месяц:'
month = gets.chomp.to_i
puts 'Введите год:'
year = gets.chomp.to_i

months = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]

leap_year = ((year%4 == 0 and year%100 != 0) or (year%400 == 0)) ? true : false
months[1] += 1 if leap_year

day_serial_number = day
i = 1;
months.map do |value|
  if i < month
    day_serial_number += value
  end
  i += 1
end
puts day_serial_number


