class PassengerTrain < Train

  def initialize(number, name, speed = 0)
    super(number, name, speed)
    @carriages = []
  end

  def add_carriage(carriage)
    if stopped? && carriage.kind_of?(PassengerCarriage)
      @carriages << carriage
    else
      puts 'Нельзя прицеплять не пасажирский вагон, либо поезд должен быть остановлен'
    end
  end

  def del_carriage(carriage)
    if stopped? && carriage.kind_of?(PassengerCarriage)
      @carriages.delete(carriage)
      puts 'Отцеплен пасажирский вагон'
    else
      puts 'Остановите поезд чтобы отцепить вагоны'
    end
  end
end