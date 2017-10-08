puts 'Введите день:'
day = gets.chomp.to_i
puts 'Введите месяц:'
month = gets.chomp.to_i
puts 'Введите год:'
year = gets.chomp.to_i

months = { 1 => 31,
          2 => 28,
          3 => 31,
          4 => 30,
          5 => 31,
          6 => 30,
          7 => 31,
          8 => 31 ,
          9 => 30,
          10 => 31,
          11 => 30,
          12 => 31
}

leap_year = ((year%4 == 0 and year%100 != 0) or (year%400 == 0)) ? true : false
months[2] += 1 if leap_year

day_serial_number = day
months.each do |key, value|
  if key < month
    day_serial_number += value
  end
end
puts day_serial_number


