class Route
  attr_reader :stations, :name, :first_station, :end_station

  NAME_FORMAT = /^[\w]{3,}\-\d{1,4}/i

  def initialize(name, first_station, end_station)
    @name = name
    @first_station = first_station
    @end_station = end_station
    validate!
    @stations = [first_station, end_station]
  end

  def add_station(station)
    @stations.insert(-2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end

  private

  def validate!
    raise 'Имя маршрута не валидно' if name !~ NAME_FORMAT
    raise 'Начальная станция не является объектом станции' if !first_station.instance_of?(Station)
    raise 'Конечная станция не является объектом станции' if !end_station.instance_of?(Station)
  end

  def valid?
    validate!
  rescue
    true
  end
end