class Station
  include InstanceCounter
  attr_reader :trains, :name

  @@stations = []

  @@instances = 0

  def initialize(name)
    @name = name
    @trains = []
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
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