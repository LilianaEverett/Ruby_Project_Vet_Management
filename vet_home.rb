require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/patient_controller')
require_relative('controllers/vet_controller')
require_relative('controllers/owner_controller')
also_reload( '../models/*' )
require('pry')

get '/' do
  erb( :index )
end
