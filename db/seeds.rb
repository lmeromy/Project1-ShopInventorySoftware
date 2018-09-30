require_relative('../models/item')
require_relative('../models/manuf')
require_relative('../models/stock')
require('pry')


Item.delete_all()
Manufacturer.delete_all()
Stock.delete_all()


item1 = Item.new({'product' => 'Climbing Harness', 'category' => 'Climb', 'costprice' => 50, 'sellprice' => 100})
item2 = Item.new({'product' => 'Rope', 'category' => 'Climb', 'costprice' => 84, 'sellprice' => 140})
item3 = Item.new({'product' => 'Softshell jacket', 'category' => 'General', 'costprice' => 72, 'sellprice' => 120})
item4 = Item.new({'product' => 'Insulated down jacket', 'category' => 'General', 'costprice' => 108, 'sellprice' => 180})
# binding.pry
# nil
item1.save()
item2.save()
item3.save()
item4.save()

item1.costprice = 60
item1.update

manufacturer1 = Manufacturer.new({'name' => 'Black Diamond', 'sector' => 'Gear'})
manufacturer2 = Manufacturer.new({'name' => 'Patagonia', 'sector' => 'Clothing'})


manufacturer1.save()
manufacturer2.save()

manufacturer2.sector = 'Technical Clothing'
manufacturer2.update()

# add Jottnar, Mountain HArdware, Icelantic, La Sportiva, Melanzana
stock1 = Stock.new({'item_id' => item1.id, 'manuf_id' => manufacturer1.id, 'quantity' => 30})
stock2 = Stock.new({'item_id' => item2.id, 'manuf_id' => manufacturer1.id, 'quantity' => 20})
stock3 = Stock.new({'item_id' => item3.id, 'manuf_id' => manufacturer2.id, 'quantity' => 50})
stock4 = Stock.new({'item_id' => item4.id, 'manuf_id' => manufacturer2.id, 'quantity' => 50})

stock1.save()
stock2.save()
stock3.save()

stock3.quantity = 40
stock3.update()



# stock4.delete()
binding.pry
nil
