require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('models/stock')
require_relative('models/item')
require_relative('models/manuf')
also_reload( '/models/*' )
# require_relative('controllers/item_controller')
require_relative('controllers/manuf_controller')
require_relative('controllers/stock_controller')


# this is the homepage! will have nav!
get '/' do
  erb(:index)
end

# get '/item/new' do
#   @items = Item.all()
#   erb(:"item/new")
# end
#
# post '/item' do
#   item = Item.new(params)
#   item.save
#   redirect to('/inventory')
# end

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
