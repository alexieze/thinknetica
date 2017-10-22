
class RailStationCompany
  attr_reader :name, :stations, :trains, :routes
  def initialize(name, manage_messages)
    @name = name
    @stations = []
    @trains   = []
    @routes   = []
    @message = manage_messages
  end


  def run()
    @message.commands
    run_process
  end

  private

  def run_process
    puts 'Введите команду:'
    task = gets.chomp.to_s.downcase
    loop do
      if task == 'manage_stations'

      end
      break
    end
  end

  def manage ()
end