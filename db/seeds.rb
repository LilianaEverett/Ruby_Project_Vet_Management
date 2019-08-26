require_relative( "../models/patient.rb" )
require_relative( "../models/vet.rb" )

require("pry-byebug")

Patient.delete_all()
Vet.delete_all()

vet1 = Vet.new({
  "first_name" => "Lindsay",
  "last_name" => "Halcrow"
})

vet2 = Vet.new({
  "first_name" => "Anne",
  "last_name" => "Halcrow"
})

vet1.save()
vet2.save()

owner1 = Owner.new({
  "first_name" => "Lindsay",
  "last_name" => "Halcrow",
  "contact" => "07865435678"
})

owner1.save 

patient1 = Patient.new({
  "name" => "Romero",
  "type" => "cat",
  "db" => "01/08/2017",
  "owner_id" => owner1.id,
  "vet_id" => vet1.id,
  "notes" => "This is a note",
  "pic" => "romero.jpg"
})

patient2 = Patient.new({
  "name" => "Ruffus",
  "type" => "cat",
  "db" => "01/08/2017",
  "owner_id" => owner1.id,
  "vet_id" => vet1.id,
  "notes" => "This is a note",
  "pic" => "ruffus.jpg"
})

patient1.save()
patient2.save()



binding.pry
nil
