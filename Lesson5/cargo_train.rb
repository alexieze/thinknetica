class CargoTrain < Train
  include Company
  def initialize(number, name, speed = 0)
    super(number, name, speed)
  end
end