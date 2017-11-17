class CargoCarriage < Carriage
  attr_reader :total_volume, :busy_volume

  def initialize(name, total_volume)
    @total_volume = total_volume
    @busy_volume = 0
    super(name)
  end

  def fill_volume(volume)
    if @total_volume > (@busy_volume + volume)
      @busy_volume += volume
      "В цестерну добавлено #{volume} едениц вещества"
    else
      'Объем привышен'
    end
  end

  def free_volume
    @total_volume - @busy_volume
  end
end
