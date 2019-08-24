require_relative( "../models/patient.rb" )
require_relative( "../models/vet.rb" )

require("pry-byebug")

Patient.delete_all()
Vet.delete_all()

vet1 = Vet.new({
  "first_name" => "Lindsay",
  "last_name" => "Halcrow"
})

vet1.save()

patient1 = Patient.new({
  "name" => "Romero",
  "type" => "cat",
  "db" => "01/08/2017",
  "owner_contact" => "07856256374",
  "vet_id" => vet1.id,
  "notes" => "This is a note"
})

patient1.save()



binding.pry
nil
