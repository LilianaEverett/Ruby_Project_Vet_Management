require( 'sinatra' )
require( 'sinatra/contrib/all' )
require_relative( '../models/patient.rb' )
also_reload( '../models/*' )

get '/patients' do
  @patients = Patient.all()
  erb ( :"patients/index" )
end

get '/patients/:id' do
  @patient = Patient.find(params['id'].to_i)
  erb(:"patients/show")
end
