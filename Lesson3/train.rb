class Train
  attr_reader :number, :name, :type, :carriage, :speed
  def initialize(number, name, type, carriage, speed = 0)
    @number = number
    @name = name
    @type = type
    @carriage = carriage
    @speed = speed
  end

  def add_carriage=(carriage)
    if @speed == 0
      @carriage += carriage
      puts "Вы успешно прицепили #{carriage} вагон(ов)"
    else
      puts 'Нельзя прицеплять вагоны когда поезд движется'
    end
  end

  def del_carriage=(carriage)
    if @speed == 0
      @carriage -= carriage
      puts "Вы успешно отцепили #{carriage} вагон(ов)"
    else
      puts 'Нельзя отцеплять вагоны когда поезд движется'
    end
  end

  def speed
    @speed
  end

  def speed=(speed)
    @speed = speed
  end

  def carriage
    @carriage
  end

  def route(route)
    if route.instance_of? Route
      @route = route
      @route.route.each do |station|
        station.add_train self
        break
      end
      self.go_next
    else
      puts 'Вы передали не известный экземплар класса пути'
    end
  end

  def current_station
    @route.route.each do |station|
      return station if station.checkTrain? self
    end
  end

  def prev_station
    current_station = self.current_station
    if current_station != nil
      @route.route.each_with_index do |station, index |
        if station == current_station
          return @route.route[index - 1] != nil ? @route.route[index - 1] : nil
        end
      end
    end
  end

  def next_station
    current_station = self.current_station
    if current_station != nil
      @route.route.each_with_index do |station, index |
        if station == current_station
          return @route.route[index + 1] != nil ? @route.route[index + 1] : nil
        end
      end
    end
  end

  def go_next
    @speed = 50
    current_station = self.current_station
    next_station = self.next_station
    if next_station != nil
      current_station.del_train self
      next_station.add_train self
    else
      puts "Конечная станция #{current_station.name} дальше двигаться нельзя"
    end
  end

  def go_prev
    @speed = 50
    current_station = self.current_station
    prev_station = self.prev_station
    if prev_station != nil
      current_station.del_train self
      prev_station.add_train self
    else
      puts "Конечная станция #{current_station.name} дальше двигаться нельзя"
    end
  end

end