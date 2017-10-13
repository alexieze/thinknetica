def whatever
  yield
end
cat = "Голодный кот"
# def locate_cat
#   puts "Кажется, #{cat} на крыше."
# end
# locate_cat

whatever do
  puts "#{cat} добрался до колбасы!"
  cat = "Уже не голодный кот"
end


puts cat