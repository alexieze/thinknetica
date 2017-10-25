
class RailStationCompany
  attr_reader :name, :stations, :trains, :routes
  def initialize(name)
    @name = name
    @stations = []
    @trains   = []
    @routes   = []
  end


  def run()
    show_commands
    run_process
  end

  private

  def run_process
    loop do
      puts 'Введите команду:'
      task = gets.chomp.to_s.downcase
      if task == 'add_station'
        add_station
      elsif task == 'list_stations'
        puts 'Список станций:'
        list_stations
      elsif task == 'add_train'
        add_train
      elsif task == 'list_trains'
        list_trains
      elsif task == 'add_route'
        add_route
      elsif task == 'list_route'
      elsif task == 'exit'
        break
      end
      p @routes
      next
    end
  end

  def add_station
    puts 'Введите название станции:'
    station_name = gets.chomp.to_s
    if !check_station?(station_name)
      station = Station.new(station_name)
    else
      puts "Станция с именем #{station_name} уже существует"
    end
    @stations << station
  end

  def add_train
    puts 'Какой поезд нужно добавить'
    puts '1 - Пасажирский'
    puts '2 - Грузовой'
    train_type = gets.chomp.to_i
    if train_type == 1
      puts 'Введите номер поезда'
      train_number = gets.chomp.to_i
      puts 'Введите имя поезда'
      train_name = gets.chomp.to_s
      train = PassengerTrain.new(train_number, train_name)
    elsif train_type == 2
      puts 'Введите номер поезда'
      train_number = gets.chomp.to_i
      puts 'Введите имя поезда'
      train_name = gets.chomp.to_s
      train = PassengerTrain.new(train_number, train_name)
    end
    @trains << train
  end

  def add_route
    puts 'Список станций'
    list_stations
    puts 'Введите имя начальной станции'
    station_start = gets.chomp.to_s.downcase
    puts 'Введите имя конечной станции'
    station_end = gets.chomp.to_s.downcase
    if station_end && station_start
      puts 'Введите имя маршрута'
      route_name = gets.chomp.to_s
      if !check_route?(route_name)
        route = Route.new(route_name, station_start, station_end)
        @routes << route
      else
        puts 'Данный машрут уже существует'
      end
    else
      puts 'Проверьте названия станций оно не может быть пустым'
    end
  end

  def add_station_to_route
    puts 'Введите название станции'
    station_name = gets.chomp.to_s
    puts 'Введите название марштура'
    route_name = gets.chomp.to_s
    if check_station?(station_name) && check_route?(route_name)
      station = get_station_by_name(station_name)
      route = get_route_by_name(route_name)
      route.add_station(station)
    else
      puts 'Проверьте правильность заполнения марштура или станции'
    end
  end

  #def route_station_exits?()

  def check_station?(name)
    @stations.each do |station|
      return true if station.name.downcase == name.downcase
    end
    return false
  end

  def check_route?(name)
    @routes.each do |route|
      return true if route.name.downcase == name.downcase
    end
    return false
  end

  def list_stations
    @stations.each do |station|
      puts station.name
    end
  end

  def list_trains
    @trains.each do |train|
      puts train.name
    end
  end

  def get_train_by_name(name)
    @trains.select do |train|
      train if train.name.downcase == name.downcase
    end
  end

  def get_station_by_name(name)
    @stations.select do |station|
      station if station.name.downcase == name.downcase
    end
  end

  def get_route_by_name(name)
    @routes.select do |route|
      route.name.downcase == name.downcase ? route : false
    end
  end

  def show_commands
    puts 'Команды управления станциями"
         [list_stations] - Показать список станций
         [add_station] - Добавить станцию
         Команды управления поездами:
         [list_trains] - Список поездов
         [add_train] - Добавить позед
         Команды управления вагонами
         [add_carriage] - Добавить вагон
         [del_carriage] - Удалить вагон
         Управление маршрутами
         [add_route] - Добавить маршрут
          '
  end
end