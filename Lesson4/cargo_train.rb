class CargoTrain < Train

  def initialize(number, name, speed = 0)
    super(number, name, speed)
    @carriages = []
  end

  def add_carriage(carriage)
    if stopped? && carriage.instance_of?(CargoCarriage)
      @carriages << carriage
      puts 'Прицеплен грузовой вагон'
    else
      puts 'Нельзя прицеплять не грузовой вагон, либо поезд должен быть остановлен'
    end
  end

  def del_carriage(carriage)
    if stopped? && carriage.kind_of?(CargoCarriage)
      @carriages.delete(carriage)
      puts "Отцеплен грузовой вагон #{carriage.name}"
    else
      puts 'Остановите поезд чтобы отцепить вагон'
    end
  end
end