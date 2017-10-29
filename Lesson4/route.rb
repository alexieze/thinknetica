class Route
  attr_reader :stations, :name
  def initialize(name, first_station, end_station)
    @name = name
    @stations = [first_station, end_station]
  end

  def add_station(station)
    @stations.insert(- 2, station)
  end

  def del_station(station)
    @stations.delete(station)
  end
end