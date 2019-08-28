require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/patient.rb' )
require_relative('../models/vet.rb')
require_relative('../models/owner.rb')

also_reload( '../models/*' )

get '/patients' do
  @owners = Owner.all
  @vets = Vet.all
  @patients = Patient.all()
  erb ( :"patients/index" )
end

# new
get '/patients/new' do
  @patients = Patient.all
  @owners = Owner.all
  @vets = Vet.all
  erb(:"patients/new")
end

post '/patients' do
  patient = Patient.new(params)
  patient.save
  redirect to("/patients")
end

get '/patients/:id/show' do
  @owners = Owner.all
  @vets = Vet.all
  @patient = Patient.find_by_id(params['id'].to_i)
  erb(:"patients/show")
end

get '/patients/:id/edit' do
  @owners = Owner.all
  @vets = Vet.all
  @patient = Patient.find_by_id(params['id'])
  erb(:"patients/edit")
end

post '/patients/:id' do
  patient = Patient.new(params)
  patient.update
  redirect to "/patients/#{params['id']}"
end

post '/patients/:id/delete' do
  patient = Patient.find_by_id(params['id'])
  patient.delete
  redirect to '/patients'
end
