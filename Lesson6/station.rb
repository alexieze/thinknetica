class Station
  include InstanceCounter
  attr_reader :trains, :name

  @@stations = []

  @@instances = 0

  NAME_FORMAT = /^[\w]{3,}$/i

  def initialize(name)
    @name = name
    validate!
    @trains = []
    @@stations << self
    register_instance
  end

  def self.all
    @@stations
  end

  def add_train(train)
    @trains << train
    "Поезд #{train.name} прибыл на станцию #{self.name}"
  end

  def del_train(train)
    @trains.delete(train)
    "Поезд #{train.name} отправился в путь со станции #{self.name}"
  end

  def validate!
    raise 'Имя станции не валидно' if name !~ NAME_FORMAT
  end

  def valid?
    validate!
  rescue
    true
  end
end