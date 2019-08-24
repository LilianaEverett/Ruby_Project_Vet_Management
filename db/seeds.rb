require_relative( "../models/patient.rb" )
require_relative( "../models/vet.rb" )

require("pry-byebug")

Vet.delete_all()
Patient.delete_all()


patient1 = Patient.new({
  "name" => "Romero",
  "type" => "cat",
  "db" => "01/08/2017",
  "owner_contact" => "07856256374",
  "vet_id" => vet1.id,
  "notes" => "This is a note"
})

patient1.save()
