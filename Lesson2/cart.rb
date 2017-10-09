products = {}

loop do
  puts 'Введите название продукта'
  product_name = gets.chop.to_s.downcase

  if nil != product_name =~ /^(стоп)$/
    price = 0
    products.each do |product_name, product_price|
      price += product_price.to_f
    end
    puts "Итоговая стоимость корзины покупок равна #{price} р."
    break;
  else
    puts 'Введите количество продукта'
    product_count = gets.chomp.to_i

    puts 'Введите цену за продукт'
    product_price = gets.chomp.to_f

    products[product_name] = product_price * product_count
  end
end