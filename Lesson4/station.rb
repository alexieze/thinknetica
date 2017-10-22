class Station

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
    @stations = []
  end

  def set_free_station(station)
    @stations << station
  end

  def show_names_free_stations
    @stations.each do |station|
      puts station.name
    end
  end

  def get_station_from_free(station_name)
    @stations.delete_if do |station|
      station.name == station_name
    end
  end

  def add_train(train)
    @trains << train
    puts "Поезд #{train.name} прибыл на станцию #{self.name}"
  end

  def del_train(train)
    @trains.delete(train)
    puts "Поезд #{train.name} отправился в путь со станции #{self.name}"
  end
end