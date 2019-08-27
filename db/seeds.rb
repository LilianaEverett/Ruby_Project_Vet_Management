require_relative( "../models/patient.rb" )
require_relative( "../models/vet.rb" )
require_relative("../models/owner.rb")

require("pry-byebug")

Patient.delete_all()
Vet.delete_all()
Owner.delete_all()

vet1 = Vet.new({
  "first_name" => "Lindsay",
  "last_name" => "Halcrow"
})

vet2 = Vet.new({
  "first_name" => "Robert",
  "last_name" => "Boston"
})

vet1.save()
vet2.save()

owner1 = Owner.new({
  "first_name" => "Laura",
  "last_name" => "Smith",
  "contact" => "07865435678"
})

owner2 = Owner.new({
  "first_name" => "Sarah",
  "last_name" => "Russell",
  "contact" => "07865435678"
})

owner3 = Owner.new({
  "first_name" => "Scott",
  "last_name" => "Saunders",
  "contact" => "07865435678"
})

owner4 = Owner.new({
  "first_name" => "Richard",
  "last_name" => "Owen",
  "contact" => "07865435678"
})
owner1.save
owner2.save
owner3.save
owner4.save

patient1 = Patient.new({
  "name" => "Romeo",
  "type" => "cat",
  "db" => "01/08/2015",
  "owner_id" => owner2.id,
  "vet_id" => vet1.id,
  "notes" => "This is a note",
  "pic" => "romeo.jpg"
})

patient2 = Patient.new({
  "name" => "Ruffus",
  "type" => "dog",
  "db" => "01/09/2018",
  "owner_id" => owner3.id,
  "vet_id" => vet1.id,
  "notes" => "This is a note",
  "pic" => "ruffus.jpg"
})

patient3 = Patient.new({
  "name" => "George",
  "type" => "sheep",
  "db" => "01/08/2017",
  "owner_id" => owner3.id,
  "vet_id" => vet2.id,
  "notes" => "This is a note",
  "pic" => "george.jpg"
})

patient4 = Patient.new({
  "name" => "Leonardo",
  "type" => "parrot",
  "db" => "01/08/2017",
  "owner_id" => owner1.id,
  "vet_id" => vet1.id,
  "notes" => "This is a note",
  "pic" => "leonardo.jpg"
})

patient5 = Patient.new({
  "name" => "Pixie",
  "type" => "rabbit",
  "db" => "01/08/2017",
  "owner_id" => owner2.id,
  "vet_id" => vet2.id,
  "notes" => "This is a note",
  "pic" => "pixie.jpg"
})

patient6 = Patient.new({
  "name" => "Sophie",
  "type" => "pig",
  "db" => "01/08/2017",
  "owner_id" => owner3.id,
  "vet_id" => vet2.id,
  "notes" => "This is a note",
  "pic" => "sophie.jpg"
})

patient7 = Patient.new({
  "name" => "Dora",
  "type" => "dog",
  "db" => "01/08/2017",
  "owner_id" => owner1.id,
  "vet_id" => vet1.id,
  "notes" => "This is a note",
  "pic" => "dora.jpg"
})

patient8 = Patient.new({
  "name" => "Max",
  "type" => "cat",
  "db" => "01/08/2017",
  "owner_id" => owner4.id,
  "vet_id" => vet1.id,
  "notes" => "This is a note",
  "pic" => "max.jpg"
})
patient1.save()
patient2.save()
patient3.save()
patient4.save()
patient5.save()
patient6.save()
patient7.save()
patient8.save()


binding.pry
nil
