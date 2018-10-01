require_relative('../models/item')
require_relative('../models/manuf')
require('pry')


Item.delete_all()
Manufacturer.delete_all()


# add Jottnar, Mountain HArdware, Icelantic, La Sportiva, Melanzana
manufacturer1 = Manufacturer.new({'name' => 'Black Diamond', 'sector' => 'Gear'})
manufacturer2 = Manufacturer.new({'name' => 'Patagonia', 'sector' => 'Clothing'})

manufacturer1.save()
manufacturer2.save()

manufacturer2.sector = 'Technical Clothing'
manufacturer2.update()

item1 = Item.new({'product' => 'Climbing Harness', 'category' => 'Climb', 'costprice' => 50, 'sellprice' => 100, 'manuf_id' => manufacturer1.id, 'quantity' => 100})

item2 = Item.new({'product' => 'Rope', 'category' => 'Climb', 'costprice' => 84, 'sellprice' => 140, 'manuf_id' => manufacturer1.id, 'quantity' => 50})

item3 = Item.new({'product' => 'Softshell jacket', 'category' => 'General', 'costprice' => 72, 'sellprice' => 120, 'manuf_id' => manufacturer2.id, 'quantity' => 50})

item4 = Item.new({'product' => 'Insulated down jacket', 'category' => 'General', 'costprice' => 108, 'sellprice' => 180, 'manuf_id' => manufacturer2.id, 'quantity' => 50})
# binding.pry
# nil
item1.save()
item2.save()
item3.save()
item4.save()

item1.costprice = 60
item1.update


# stock4.delete()
binding.pry
nil
