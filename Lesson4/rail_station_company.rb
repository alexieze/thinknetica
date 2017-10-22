
class RailStationCompany
  attr_reader :name, :stations, :trains, :routes
  def initialize(name, manage_messages)
    @name = name
    @stations = []
    @trains   = []
    @routes   = []
    @message = manage_messages
  end


  def run()
    run_process
  end

  private

  def run_process
    loop do
      @message.commands
      puts 'Введите команду:'
      task = gets.chomp.to_s.downcase
      if task == 'add_station'
        puts 'Введите название станции:'
        station_name = gets.chomp.to_s
        if !check_station?(station_name)
          station = Station.new(gets.chomp.to_s)
          @stations << station
        else
          puts 'Станция с таким именем уже существует'
        end
      elsif task == 'list_stations'
        puts 'Список станций:'
        list_stations
      elsif task == 'add_train'
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
      elsif task == 'list_trains'
        list_trains
      elsif task == 'add_route'

      elsif task == 'list_route'
      elsif task == 'exit'
        break
      end
      next
    end
  end

  private

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

  def get_train_by_name(name, type_train)
    @trains.select do |train|
      train if train.name.downcase == name.downcase && train.kind_of?(type_train)
    end
  end

  def get_station_by_name(name)
    @stations.select do |station|
      station if station.name.downcase == name.downcase
    end
  end

  def check_station?(name)
    @stations.each do |station|
      return true if station.name.downcase == name.downcase
    end
    false
  end


end