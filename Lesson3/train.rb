class Train
  attr_reader :number, :name, :type, :carriage, :speed
  def initialize(number, name, type, carriage, speed = 0)
    @number, @name, @type, $carriage, @speed = number, name, type, carriage, speed
  end

  def add_carriage=(carriage)
    if @speed == 0
      @carriage = carriage
      puts "Вы успешно отцепили #{@carriage} вагон(ов)"
    else
      puts 'Нельзя прицеплять вагоны когда поезд движется'
    end
  end

  def del_carriage=(carriage)
    if @speed == 0
      @carriage = carriage
      puts "Вы успешно прицепили #{@carriage} вагон(ов)"
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
      self.go_next
    else
      puts 'Вы передали не известный экземплар класса пути'
    end
  end

  def current_station
  end

  def prev_station

  end

  def go_next
    @speed = 50
    p @route
  end

  def go_prev

  end

end