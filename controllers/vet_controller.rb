require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/vet.rb' )
also_reload( '../models/*' )

get '/vets' do
  @vets = Vet.all()
  erb ( :"vets/index" )
end

# new
get '/vets/new' do
  erb(:"vets/new")
end

post '/vets' do
  vet = Vet.new(params)
  vet.save
  redirect to("/vets")
end

# show
get '/vets/:id/show' do
  @vet = Vet.find_by_id(params['id'].to_i)
  @patients = @vet.patients
  erb(:"vets/show")
end

get '/vets/:id/edit' do
  @vet = Vet.find_by_id(params['id'])
  erb(:"vets/edit")
end

post '/vets/:id' do
  vet = Vet.new(params)
  vet.update
  redirect to "/vets/#{params['id']}/show"
end

post '/vets/:id/delete' do
  vet = Vet.find_by_id(params['id'])
  vet.delete
  redirect to '/vets'
end
