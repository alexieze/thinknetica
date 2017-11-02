class Train
  include InstanceCounter
  attr_reader :number, :name, :speed, :carriages

  @@number = []

  def initialize(number, name, speed = 0)
    @name = name
    @carriages = []
    @speed = speed
    @@number.insert(number, self)
  end

  def self.find(number)
    @@number[number] if @@number[number] || nil
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
      p @route.stations
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
      @carriages << carriage
      puts "Прицеплен вагон #{carriage.name}"
  end

  def del_carriage(carriage)
    @carriages.delete(carriage)
    puts "Отцеплен вагон #{carriage.name}"
  end

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