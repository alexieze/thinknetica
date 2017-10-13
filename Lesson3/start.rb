require './station.rb'
require './train.rb'
require './route.rb'


moscow = Station.new('Москва')
piter = Station.new('Питер')
alabino = Station.new('Алабино')

route1 = Route.new(moscow, piter)
route1.add_station(alabino)

train1 = Train.new(1, 'Train 1', 'пасажирский', 5)
train2 = Train.new(2, 'Train 2', 'грузовой', 5)

train1.route route1
train2.route route1
train1.speed = 0
train1.add_carriage = 7
puts train1.carriage
train1.go_next
puts train1.current_station.name
puts train2.current_station.name
puts alabino.get_types_of_trains