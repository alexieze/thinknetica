class Station
  include InstanceCounter
  include Validation
  attr_reader :trains, :name

  @@stations = []

  @@instances = 0

  NAME_FORMAT = /^[\w]{3,}$/i

  validate :name, :format, NAME_FORMAT
  validate :name, :presence

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
    "Поезд #{train.name} прибыл на станцию #{name}"
  end

  def del_train(train)
    @trains.delete(train)
    "Поезд #{train.name} отправился в путь со станции #{name}"
  end

  def show_trains
    @trains.each do |train|
      yield(train)
    end
  end

end
