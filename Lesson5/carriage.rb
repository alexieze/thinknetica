class Carriage
  include Company
  attr_reader :name
  def initialize(name)
    @name = name
  end
end