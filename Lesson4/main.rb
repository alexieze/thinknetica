require_relative 'station'
require_relative 'train'
require_relative 'route'
require_relative 'carriage'
require_relative 'passenger_carriage'
require_relative 'cargo_carriage'
require_relative 'passenger_train'
require_relative 'cargo_train'


moscow    = Station.new('Москва')
borvichi  = Station.new('Борвичи')
piter     = Station.new('Питер')

route_moscow_piter = Route.new(moscow, piter)
route_moscow_piter.add_station(borvichi)



cargo_train = CargoTrain.new(1, 'Cargo train')
cargo_train.route(route_moscow_piter)


cargo_carriage1 = CargoCarriage.new('цестерна с маслом')
cargo_carriage2 = CargoCarriage.new('цестерна с бензином')

cargo_train.add_carriage(cargo_carriage1)
cargo_train.add_carriage(cargo_carriage2)

cargo_train.speed = 10;
cargo_train.go_next

cargo_train.stop()
cargo_train.del_carriage(cargo_carriage2)
cargo_train.speed = 10

cargo_train.go_next
cargo_train.stop
cargo_train.del_carriage(cargo_carriage1)


