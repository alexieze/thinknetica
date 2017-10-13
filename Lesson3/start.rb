require './station.rb'
require './train.rb'
require './route.rb'


moscow = Station.new('Москва')
piter = Station.new('Питер')
borvichi = Station.new('Борвичи')
bologoe = Station.new('Бологое')

route1 = Route.new(moscow, piter)


route1.add_station bologoe
route1.add_station borvichi


train1 = Train.new(1, 'Train 1', 'пасажирский', 5)



train1.route(route1)
train1.add_carriage()
train1.speed = 10
train1.go_next()
train1.go_next()
train1.go_next()
train1.stop()
train1.del_carriage()



