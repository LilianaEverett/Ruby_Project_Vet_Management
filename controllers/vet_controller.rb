require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/vet.rb' )
also_reload( '../models/*' )

get '/vets' do
  @vets = Vet.all()
  erb ( :"vets/index" )
end

get '/vets/:id' do
  @vet = Vet.find_by_id(params['id'].to_i)
  erb(:"vets/show")
end
