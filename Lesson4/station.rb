class Station

  attr_reader :trains, :name
  def initialize(name)
    @name = name
    @trains = []
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