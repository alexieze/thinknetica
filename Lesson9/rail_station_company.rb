
class RailStationCompany
  attr_reader :name, :stations, :trains, :routes
  def initialize(name)
    @name = name
    @stations = []
    @trains   = []
    @routes   = []
  end

  def run
    show_commands
    run_process
  end

  private

  def show_commands

    puts '
         Команды управления станциями"
         [add_station] - Добавить станцию
         [list_stations] - Показать список станций
         [list_trains_on_station] - Список поездов на станции

         Команды управления поездами:
         [list_trains] - Список поездов
         [add_train] - Добавить позед
         [add_route_to_train] - Добавить позед
         [go_next_station] - Переместиться на следующую станцию
         [go_prev_station] - Вернуться на предыдущую станцию

         Команды управления вагонами
         [add_carriage_to_train] - Прицепить вагон к поезду
         [del_carriage_from_train] - Отцепить вагон от позеда
         [list_carriages] - Список вагонов у поезда

         Управление маршрутами
         [add_route] - Добавить маршрут
         [list_routes] - Список маршрутов
         [add_station_to_route] - Добавить станцию к маршруту
         [del_station_from_route] - Удалить станцию у маршрута
          '
  end

  def run_process
    loop do
      puts 'Введите команду:'
      task = gets.chomp.to_s.downcase
      case task
      when 'add_station' then add_station
      when 'list_stations' then list_stations
      when 'list_trains_on_station' then list_trains_on_station
      when 'show_trains_on_station' then show_trains_on_station
      when 'add_train' then add_train
      when 'add_route_to_train' then add_route_to_train
      when 'go_next_station' then go_next_station
      when 'go_prev_station' then go_prev_station
      when 'list_trains' then list_trains
      when 'show_carriages_of_train' then show_carriages_of_train
      when 'add_route' then add_route
      when 'list_routes' then list_routes
      when 'add_station_to_route' then add_station_to_route
      when 'del_station_from_route' then del_station_from_route
      when 'add_carriage_to_train' then add_carriage_to_train
      when 'del_carriage_from_train' then del_carriage_from_train
      when 'list_carriages' then list_carriages
      when 'add_seat' then add_seat
      when 'fill_volume' then fill_volume
      when 'exit' then break
      end
      next
    end
  end

  def show_trains_on_station
    puts 'Введите название станции'
    station = get_station_by_name(gets.chomp.to_s)
    station.show_trains do |train|
      puts "Номер поезда: #{train.number}; Тип поезда: #{train.type}; Количество вагонов: #{train.carriages.length} ;"
    end
  end

  def show_carriages_of_train
    puts 'Введите номер поезда'
    train_number = gets.chomp
    train = Train.find(train_number)
    train.detail_info_carriages do |carriage|
      if carriage.instance_of?(PassengerCarriage)
        puts "Номер вагона #{carriage.number}, Тип вагона #{carriage.type},Свободно #{carriage.free_seats} мест, #{carriage.busy_seats} занято мест"
      elsif carriage.instance_of?(CargoCarriage)
        puts "Номер вагона #{carriage.number}, Тип вагона #{carriage.type}, Свободно #{carriage.free_volume} едениц объема, занято #{carriage.busy_volume} едениц объема"
      end
    end
  end

  def list_trains_on_station
    list_stations
    puts 'Введите имя станции:'
    station_name = gets.chomp.to_s
    station = get_station_by_name(station_name)
    station.trains.each do |train|
      puts train.name
    end
  end

  def go_next_station
    puts 'Введите имя поезда'
    train_name = gets.chomp.to_s
    train = get_train_by_name(train_name)
    train.speed = 10
    puts train.go_next
  end

  def go_prev_station
    puts 'Введите имя поезда'
    train_name = gets.chomp.to_s
    train = get_train_by_name(train_name)
    train.speed = 10
    puts train.go_prev
  end

  def add_carriage_to_train
    puts 'Введите имя поезда'
    train_name = gets.chomp.to_s
    train = get_train_by_name(train_name)
    train.stop
    puts 'Введите имя вагона'
    carriage_name = gets.chomp.to_s
    if train.is_a?(CargoTrain)
      puts 'Укажите объем цестерны'
      total_volume = gets.chomp.to_i
      cargo_carriage = CargoCarriage.new(carriage_name, total_volume)
      puts train.add_carriage(cargo_carriage)
    elsif train.stopped? && train.is_a?(PassengerTrain)
      puts 'Укажите количество мест'
      all_seats = gets.chomp.to_i
      passenger_carriage = PassengerCarriage.new(carriage_name, all_seats)
      puts train.add_carriage(passenger_carriage)
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def add_seat
    carriage = get_carriage
    puts carriage.add_seat
  end

  def fill_volume
    puts 'Введите количество едениц вещества'
    volume = gets.chomp.to_i
    carriage = get_carriage
    puts carriage.fill_volume(volume)
  end

  def get_carriage
    puts 'Введите номер поезда'
    train_number = gets.chomp
    puts 'Введите имя вагона'
    carriage_name = gets.chomp.to_s
    train = Train.find(train_number)
    train.carriages.detect do |carriage|
      carriage if carriage.name == carriage_name
    end
  end

  def del_carriage_from_train
    puts 'Введите имя поезда'
    train_name = gets.chomp.to_s
    train = get_train_by_name(train_name)
    train.stop
    puts 'Введите имя вагона'
    carriage_name = gets.chomp.to_s
    carriage = get_carriage_by_name(train, carriage_name)
    puts train.del_carriage(carriage)
  end

  def list_carriages
    puts 'Введите имя поезда'
    train_name = gets.chomp.to_s
    train = get_train_by_name(train_name)
    p train.carriages
  end

  def add_station
    puts 'Введите имя станции:'
    station_name = gets.chomp.to_s
    Station.new(station_name)
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def add_train
    puts 'Какой поезд нужно добавить'
    puts '1 - Пасажирский'
    puts '2 - Грузовой'
    train_type = gets.chomp.to_i
    puts 'Введите номер поезда'
    train_number = gets.chomp
    puts 'Введите имя поезда'
    train_name = gets.chomp.to_s
    raise 'Поезд с таким номером уже создан' if Train.find(train_number)
    raise 'Поезд с таким имененем уже создан' if get_train_by_name(train_name)
    if train_type == 1
      train = PassengerTrain.new(train_number, train_name)
    elsif train_type == 2
      train = CargoTrain.new(train_number, train_name)
    end
    @trains << train
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def add_route_to_train
    puts 'Введите имя поезда'
    train_name = gets.chomp.to_s
    train = get_train_by_name(train_name)
    puts 'Введите название маршрута'
    route_name = gets.chomp.to_s
    route = get_route_by_name(route_name)
    puts train.route(route)
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
      station_start = get_station_by_name(station_start)
      station_end = get_station_by_name(station_end)
      route = Route.new(route_name, station_start, station_end)
      @routes << route
    end
  rescue RuntimeError => e
    puts e.message
    retry
  end

  def add_station_to_route
    list_stations
    puts 'Введите название станции'
    station_name = gets.chomp.to_s
    list_routes
    puts 'Введите название марштура'
    route_name = gets.chomp.to_s
    station = get_station_by_name(station_name)
    route = get_route_by_name(route_name)
    puts route.add_station(station)
  end

  def del_station_from_route
    list_stations
    puts 'Введите название станции'
    station_name = gets.chomp.to_s
    list_routes
    puts 'Введите название марштура'
    route_name = gets.chomp.to_s
    station = get_station_by_name(station_name)
    route = get_route_by_name(route_name)
    if station.trains.empty?
      route.del_station(station)
    else
      puts 'Нельзя удалить станцию, на ней есть поезда'
    end
  end

  def list_stations
    Station.all.each do |station|
      puts station.name
    end
  end

  def list_trains
    @trains.each do |train|
      puts train.name
    end
  end

  def list_routes
    @routes.each do |route|
      puts route.name
    end
  end

  def get_carriage_by_name(train, carriage_name)
    train.carriages.detect do |carriage|
      carriage if carriage.name == carriage_name
    end
  end

  def get_train_by_name(name)
    @trains.detect do |train|
      train if train.name == name
    end
  end

  def get_station_by_name(name)
    Station.all.detect do |station|
      station if station.name == name
    end
  end

  def get_route_by_name(name)
    @routes.detect do |route|
      route if route.name == name
    end
  end
end
