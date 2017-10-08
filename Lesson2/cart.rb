products = {}

loop do
  puts 'Введите название продукта'
  productName = gets.chop.to_s.downcase

  if productName.include? 'стоп'
    price = 0
    products.each do |productName, productPrice|
      price += productPrice.to_f
    end
    puts "Итоговая стоимость корзины покупок равна #{price} р."
    break;
  else
    puts 'Введите цену за продукт'
    productPrice = gets.chomp.to_f
    products["'" + productName + "'"] = productPrice
  end
end