require( 'sinatra' )
require( 'sinatra/contrib/all' )
# require_relative('.controllers/stock_controller')
# require_relative('.controllers/item_controller')
# require_relative('.controllers/manuf_controller')


# this is the homepage! will have nav!
get '/' do
  erb( :index )
end
