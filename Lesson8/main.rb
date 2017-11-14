require_relative 'company'
require_relative 'instance_counter'
require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_train'
require_relative 'cargo_train'
require_relative 'rail_station_company'

rail_station_company = RailStationCompany.new('РЖД')
rail_station_company.run
