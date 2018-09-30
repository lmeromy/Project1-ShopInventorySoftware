require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('models/stock')
require_relative('models/item')
require_relative('models/manuf')
also_reload( '/models/*' )
# require_relative('.controllers/item_controller')
# require_relative('.controllers/manuf_controller')


# this is the homepage! will have nav!
get '/' do
  erb(:index)
end

# index route for All stock
get '/inventory' do
  @inventory = Stock.all()
  erb(:"inventory/index")
end

# new route for stock
get '/inventory/new' do
  @items = Item.all()
  @manufacturers = Manufacturer.all()
  erb(:"inventory/new")
end

# create route for stock
post '/inventory' do
  stock_item = Stock.new(params)
  stock_item.save()
  redirect to('/inventory')
end

# edit route
get '/inventory/:id/edit' do
  @stock_item = Stock.find(params['id'].to_i)
  @all_stock = Stock.all()
  erb(:"inventory/edit")
end

# update route
post '/inventory/:id' do
  stock_item = Stock.new(params)
  stock_item.update()
  redirect to('/inventory')
end

# delete route
post '/inventory/:id/delete' do
  stock_item = Stock.find(params['id'].to_i)
  stock_item.delete()
  redirect to('/inventory')
end

get '/item/new' do
  @items = Item.all()
  erb(:"item/new")
end

post '/item' do
  item = Item.new(params)
  item.save
  redirect to('/inventory')
end

# get '/manuf/new' do
#   @items = Item.all()
#   erb(:"manuf/new")
# end
#
# post '/manuf' do
#   item = Manufacturer.new(params)
#   item.save
#   redirect to('/inventory/new')
# end
#

#
# post '/item' do
#   item = Item.new(params)
#   item.save
#   redirect to('/inventory/new')
# end
#


# show route for individual stock objects
get '/inventory/:id' do
  @stock_item = Stock.find(params['id'].to_i)
  @item_detail = Item.find(params['id'].to_i)
  erb(:"inventory/show")
end
