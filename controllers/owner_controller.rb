require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/owner.rb' )
also_reload( '../models/*' )

get '/owners' do
  @owners = Owner.all()
  erb ( :"owners/index" )
end

# new
get '/owners/new' do
  erb(:"owners/new")
end

post '/owners' do
  owner = Owner.new(params)
  owner.save
  redirect to("/owners")
end

# show
get '/owners/:id' do
  @owner = Owner.find_by_id(params['id'].to_i)
  erb(:"owners/show")
end

get '/owners/:id/edit' do
  @owner = Owner.find_by_id(params['id'])
  erb(:"owners/edit")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update
  redirect to "/owners/#{params['id']}"
end

post '/owners/:id/delete' do
  owner = Owner.find_by_id(params['id'])
  owner.delete
  redirect to '/owners'
end

get '/owners/:id/patients' do
  @owner = Owner.find_by_id(params['id'])
  @patients = @owner.patients
  # binding.pry
  erb(:"owners/patients")
end
