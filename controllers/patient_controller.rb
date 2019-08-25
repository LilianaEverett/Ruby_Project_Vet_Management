require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/patient.rb' )
require_relative('../models/vet.rb')
also_reload( '../models/*' )

get '/patients' do
  @patients = Patient.all()
  erb ( :"patients/index" )
end

# new
get '/patients/new' do
  @vets = Vet.all
  erb(:"patients/new")
end

post '/patients' do
  patient = Patient.new(params)
  patient.save
  redirect to("/patients")
end

get '/patients/:id' do
  @patient = Patient.find_by_id(params['id'].to_i)
  erb(:"patients/show")
end

get '/patients/:id/edit' do
  @vets = Vet.all
  @patient = Patient.find_by_id(params['id'])
  erb(:"patients/edit")
end

post '/patients/:id' do
  patient = Patient.new(params)
  patient.update
  redirect to "/patients/#{params['id']}"
end
