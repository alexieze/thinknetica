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

bishkek = Station.new('Бишкек')
tokmok  = Station.new('Токмок')
kant    = Station.new('Кант')
ribache = Station.new('Рыбаче')

route_moscow_piter = Route.new(moscow, piter)
route_moscow_piter.add_station(borvichi)

route_bishkek_ribache = Route.new(bishkek, ribache)
route_bishkek_ribache.add_station(kant)
route_bishkek_ribache.add_station(tokmok)



cargo_train = CargoTrain.new(1, 'Cargo train')
cargo_train.route(route_moscow_piter)

passenger_tran = PassengerTrain.new(2, 'Passenger train')
passenger_tran.route(route_bishkek_ribache)


cargo_carriage1 = CargoCarriage.new('цестерна с маслом')
cargo_carriage2 = CargoCarriage.new('цестерна с бензином')

passenger_carriage1 = PassengerCarriage.new('Пасажирский вагон')
passenger_carriage2 = PassengerCarriage.new('Вагон ресторан')


cargo_train.add_carriage(cargo_carriage1)
cargo_train.add_carriage(cargo_carriage2)

cargo_train.speed = 10;
cargo_train.go_next

passenger_tran.add_carriage(passenger_carriage1)
passenger_tran.add_carriage(passenger_carriage2)

passenger_tran.speed = 10
passenger_tran.go_next()

cargo_train.stop()
cargo_train.del_carriage(cargo_carriage2)
cargo_train.speed = 10

passenger_tran.go_next()

cargo_train.go_next
cargo_train.stop
cargo_train.del_carriage(cargo_carriage1)

passenger_tran.go_next()
passenger_tran.go_prev()





