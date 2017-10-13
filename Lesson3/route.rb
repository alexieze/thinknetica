class Route

  def initialize(first_station, end_station)
    @first_station, @end_station = first_station , end_station
    @route = [@first_station, @end_station]
  end

  def get_route
    @route.each do |station|
      puts station.name
    end
  end

  def add_station(station)
    @route.insert(@route.length - 1, station)
  end

  def del_station(station)
    @route.delete station
  end
end