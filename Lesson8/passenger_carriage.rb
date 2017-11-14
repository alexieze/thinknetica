class PassengerCarriage < Carriage
  attr_reader :free_seats, :busy_seats
  def initialize(name, seats)
    @free_seats = seats
    @busy_seats = 0
    super(name)
  end

  def add_seat
    if @free_seats > 0
      @free_seats -= 1
      @busy_seats += 1
      'Место успешно добавлено'
    else
      'Все места заняты!'
    end
  end
end
