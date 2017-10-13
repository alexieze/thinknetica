class Train
  attr_reader :number, :name, :type, :carriage, :speed
  def initialize(number, name, type, carriage, speed = 0)
    @number = number
    @name = name
    @type = type
    @carriage = carriage
    @speed = speed
  end

  def add_carriage
    if @speed == 0
      @carriage += 1
      puts 'Вы успешно прицепили вагон'
    else
      puts 'Нельзя прицеплять вагоны когда поезд движется'
    end
  end

  def del_carriage
    if @speed == 0
      if @carriage > 0
        @carriage -= 1
        puts 'Вы успешно отцепили вагон'
      else
        puts 'Вагонов для отцепления нет'
      end
    else
      puts 'Нельзя отцеплять вагоны когда поезд движется'
    end
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

  def current_station
    @route.stations[@current_station_index]
  end

  def prev_station
    @route.stations[@current_station_index - 1]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def go_next
    if @speed > 0 && @current_station_index < @route.stations.length - 1
      @route.stations[@current_station_index].del_train(self)
      @current_station_index += 1
      @route.stations[@current_station_index].add_train(self)
    else
      puts "Конечная станция #{self.current_station.name} дальше двигаться нельзя"
    end
  end

  def go_prev
    if @speed > 0 && @current_station_index > 0
      @route.stations[@current_station_index].del_train(self)
      @current_station_index -= 1
      @route.stations[@current_station_index].add_train(self)
    else
      puts "Конечная станция #{self.current_station.name} дальше двигаться нельзя"
    end
  end
end