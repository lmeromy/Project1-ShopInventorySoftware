
require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('../models/stock')
require_relative('../models/item')
require_relative('../models/manuf')
also_reload( '/models/*' )


# index route for All manufacturers
get '/manuf' do
  @brands = Manufacturer.all()
  erb(:"manuf/index")
end

# new route for manufacturers
get '/manuf/new' do
  @manufacturers = Manufacturer.all()
  erb(:"manuf/new")
end

# create route for manufacturers
post '/manuf' do
  brand = Manufacturer.new(params)
  brand.save()
  redirect to('/manuf')
end

# edit route
get '/manuf/:id/edit' do
  @brand_object = Manufacturer.find(params['id'].to_i)
  @all_brands = Manufacturer.all()
  erb(:"manuf/edit")
end

# # update route
# post '/inventory/:id' do
#   stock_item = Stock.new(params)
#   stock_item.update()
#   redirect to('/inventory')
# end
#
# # delete route
# post '/inventory/:id/delete' do
#   stock_item = Stock.find(params['id'].to_i)
#   stock_item.delete()
#   redirect to('/inventory')
# end
