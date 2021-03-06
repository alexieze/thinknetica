class Train
  include InstanceCounter
  include Company

  attr_reader :number, :name, :speed, :carriages

  @@trains = {}

  NUMBER_FORMAT = /^[\w\d]{3}-?[\w\d]{2}$/i
  NAME_FORMAT = /^[\w]{3,}/i

  def initialize(number, name, speed = 0)
    @name = name
    @number = number
    validate!
    @carriages = []
    @speed = speed
    @@trains[number] = self
  end

  def self.find(number)
    @@trains[number]
  end

  def speed=(speed)
    @speed += speed
  end

  def stop
    @speed = 0
  end

  def detail_info_carriages
    @carriages.each do |carriage|
      yield(carriage)
    end
  end

  def type
    self.class.name
  end

  def route(route)
    @route = route
    @current_station_index = 0
    p @route.stations
    @route.stations[@current_station_index].add_train(self)
  end

  def go_next
    if @speed > 0 && @current_station_index < @route.stations.length - 1
      current_station.del_train(self)
      @current_station_index += 1
      current_station.add_train(self)
    else
      "Конечная станция #{current_station.name} дальше двигаться нельзя"
    end
  end

  def go_prev
    if @speed > 0 && @current_station_index > 0
      current_station.del_train(self)
      @current_station_index -= 1
      current_station.add_train(self)
    else
      "Конечная станция #{current_station.name} дальше двигаться нельзя"
    end
  end

  def add_carriage(carriage)
    @carriages << carriage
    "Прицеплен вагон #{carriage.name}"
  end

  def del_carriage(carriage)
    @carriages.delete(carriage)
    "Отцеплен вагон #{carriage.name}"
  end

  def stopped?
    @speed.zero?
  end

  private

  def current_station
    @route.stations[@current_station_index]
  end

  def prev_station
    @route.stations[@current_station_index - 1]
  end

  def next_station
    @route.stations[@current_station_index + 1]
  end

  def validate!
    raise 'Номер поезда не валидный' if number !~ NUMBER_FORMAT
    raise 'Имя поезда не валидное' if name !~ NAME_FORMAT
    true
  end

  def valid?
    validate!
  rescue
    true
  end
end
