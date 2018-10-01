require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/item')
require_relative('../models/manuf')
also_reload( '/models/*' )


# index (aka home) route for TOOLS
get '/tools' do
  erb(:"tools/index")
end

# tools markup route
get '/tools/markup' do
  @items = Item.all_sort_category()
  @manufacturers = Manufacturer.all()
  erb(:"tools/markup")
end

# tools markup EDIT route
get '/tools/:id/edit' do
  @item = Item.find(params['id'].to_i)
  @all_items = Item.all()
  erb(:"tools/edit")
end

# tools optimize WINTER markup route
get '/tools/optimize_winter' do
  @items_winter = Item.all_winter()
  @manufacturers = Manufacturer.all()
  erb(:"tools/optimize_winter")
end

# winter optimize markup not working yet
# see the self.all_winter() method in item.rb for issues
post '/tools/optimize_winter' do
  margin_update = params['margin'].to_i

  @items_winter = Item.all_winter()
  for item in @items_winter
    item.change_margin(margin_update)
    item.update()
  end
  # @manufacturers = Manufacturer.all()
  redirect to('/tools/optimize_winter')
end

# update markup route...NOT YET WORKING
post '/tools/:id' do
  item = Item.new(params)
  item.update()
  redirect to('/tools')
end



# # create route for items
# post '/items' do
#   item = Item.new(params)
#   item.save()
#   redirect to('/items')
# end
#


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
