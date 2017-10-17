class Train
  attr_reader :number, :name, :speed
  def initialize(number, name, speed = 0)
    @number = number
    @name = name
    @carriages = []
    @speed = speed
  end

  def speed=(speed)
    @speed += speed
  end



  def stop
    @speed = 0
  end

  def route(route)
    if route.instance_of? Route
      @route = route
      @current_station_index = 0
      @route.stations[@current_station_index].add_train(self)
    else
      puts 'Вы передали не известный экземплар класса пути'
    end
  end

  def go_next
    if @speed > 0 && @current_station_index < @route.stations.length - 1
      current_station.del_train(self)
      @current_station_index += 1
      current_station.add_train(self)
    else
      puts "Конечная станция #{current_station.name} дальше двигаться нельзя"
    end
  end

  def go_prev
    if @speed > 0 && @current_station_index > 0
      current_station.del_train(self)
      @current_station_index -= 1
      current_station.add_train(self)
    else
      puts "Конечная станция #{current_station.name} дальше двигаться нельзя"
    end
  end

  def add_carriage(carriage)
    if stopped? && check_add_carriage?(carriage)
      @carriages << carriage
      puts "Прицеплен вагон #{carriage.name}"
    else
      puts 'Нельзя прицеплять не пасажирский вагон, либо поезд должен быть остановлен'
    end
  end

  def del_carriage(carriage)
    @carriages.delete(carriage)
    puts "Отцеплен вагон #{carriage.name}"
  end

  protected
  # Данный метод поставил в protected потому что не вижу надобности делать его открытым
  # а вот в классах посредниках он будет полезен
  def stopped?
    @speed == 0? true : false
  end

  private
  # Данные методы были перещены потому что, в интерфейсе дочерних классов они не нужны, управление поездами произходит и без них
  def current_station
    @route.stations[@current_station_index]
  end

  def prev_station
    @route.stations[@current_station_index - 1]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

end