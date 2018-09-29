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

# index route for All
get '/inventory' do
  @inventory = Stock.all()
  erb(:"inventory/index")
end

# show route for individual stock objects, item details
get '/inventory/:id' do
  @stock_item = Stock.find(params['id'].to_i)
  @item_detail = Item.find(params['id'].to_i)
  erb(:"inventory/show")
end
