class Carriage
  include Company
  attr_reader :name, :number

  @@number = 0

  NAME_FORMAT = /^[\w]{3,}/i

  def initialize(name)
    @name = name
    validate!
    @number = @@number += 1
  end

  def type
    self.class.name
  end

  private

  def validate!
    raise 'Имя вагона не валидное' if name !~ NAME_FORMAT
    true
  end

  def valid?
    validate!
  rescue
    true
  end
end
