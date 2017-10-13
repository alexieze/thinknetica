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
train3 = Train.new(3, 'Train 3', 'грузовой', 5)

train1.route route1
