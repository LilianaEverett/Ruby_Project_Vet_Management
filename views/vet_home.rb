require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative('controllers/patient_controller')
require_relative('controllers/vet_controller')

get '/' do
  erb( :index )
end
