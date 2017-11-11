class Carriage
  include Company
  attr_reader :name
  NAME_FORMAT = /^[\w]{3,}/i
  def initialize(name)
    @name = name
    validate!
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