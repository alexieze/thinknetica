class PassengerTrain < Train

  def initialize(number, name, speed = 0)
    super(number, name, speed)
  end

  def check_add_carriage?(carriage)
    carriage.kind_of?(PassengerCarriage)
  end
end