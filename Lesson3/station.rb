class Station

  attr_reader :trains, :name

  def initialize(name)
    @name = name
    @trains = []
  end

  def add_train(train)
    @trains << train
  end

  def del_train(train)
    @trains.delete train
  end


  def get_types_of_trains
    passenger_trains = 0
    freight_trains = 0
    @trains.each do |train|
      if train.type == 'пасажирский'
        passenger_trains += 1
      elsif train.type == 'грузовой'
        freight_trains += 1
      end
    end
    "Пасажикских поездов на станции #{self.name} #{passenger_trains}, грузовых поездов #{freight_trains}"
  end

  def go_next(train, route)
    if self.trains.index train != nil
      train.route(route)
      train.go_next
    end
  end

  def checkTrain? train
    @trains.include? train
  end
end