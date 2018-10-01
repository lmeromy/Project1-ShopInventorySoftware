require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/item')
require_relative('../models/manuf')
also_reload( '/models/*' )


# index (aka home) route for TOOLS
get '/tools' do
  @items = Item.sort_stocklevels()
  erb(:"tools/index")
end

# tools markup route
get '/tools/markup' do
  @items = Item.all()
  @manufacturers = Manufacturer.all()
  erb(:"tools/markup")
end

# tools markup route
get '/tools/optimize' do
  @items = Item.all()
  @manufacturers = Manufacturer.all()
  erb(:"tools/optimize")
end

# # create route for items
# post '/items' do
#   item = Item.new(params)
#   item.save()
#   redirect to('/items')
# end
#
# edit route
get '/tools/:id/edit' do
  @item = Item.find(params['id'].to_i)
  @all_items = Item.all()
  erb(:"tools/edit")
end

# # update route
# post '/items/:id' do
#   item = Item.new(params)
#   item.update()
#   redirect to('/items')
# end
#
# # delete route
# post '/items/:id/delete' do
#   item = Item.find(params['id'].to_i)
#   item.delete()
#   redirect to('/items')
# end
