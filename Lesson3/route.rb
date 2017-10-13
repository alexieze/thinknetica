class Route
  attr_reader :stations
  def initialize(first_station, end_station)
    @stations = [first_station, end_station]
  end

  def get_full_route
    @stations.each do |station|
      puts station.name
    end
  end

  def add_station(station)
    @stations.insert(@stations.length - 1, station)
  end

  def del_station(station)
    @stations.delete(station)
  end
end