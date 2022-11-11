# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
Appointment.destroy_all
OwnerRecord.destroy_all
Pet.destroy_all
User.destroy_all
Vet.destroy_all

puts "Creando users"
meli = User.create!(email: "meli@gmail.com", password: "123456", name: "Melisa", surname: "Rua", address: "Calle 50 41 42", telephone_number: "45266262", city: "Medellin", country: "Colombia", cc: "516265662" )
meli.photo.attach(io: URI.open("https://media.istockphoto.com/id/1368424494/es/foto/retrato-de-estudio-de-una-mujer-alegre.jpg?s=612x612&w=is&k=20&c=x7kh9HF-HzimB5DK3Z4Y86gWoqzvliSbO_GwxQJ57ag="), filename: "meli.png", content_type: "image/jpeg")
meli.save!

puts "Creando pets"
pet1 = Pet.create!(name: "Pepe", gender: "Masc", birthdate: Date.new(2021, 5, 20), specie: "Gato", breed: "Criollo", user: meli)
pet1.photo.attach(io: URI.open("https://s1.eestatic.com/2020/05/18/como/gatos-mascotas-trucos_490961518_152142876_1024x576.jpg"), filename: "pet1.png", content_type: "image/jpeg")
pet1.save!

pet2 = Pet.create!(name: "Perla", gender: "Fem", birthdate: Date.new(2020, 10, 20), specie: "Perro", breed: "Yorkshire", user: meli)
pet2.photo.attach(io: URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/d/dd/1Yorkie.jpg/250px-1Yorkie.jpg"), filename: "pet2.png", content_type: "image/jpeg")
pet2.save!

puts "Creando vet"
vet1 = Vet.create!(email: "vet@gmail.com", password: "123456", name: "Carlos", surname: "Suarez", telephone_number: "45266262", city: "Medellin", country: "Colombia", cc: "516265662", specialty: "Dermatologia" )



puts "Creando appointments"
app1 = Appointment.create!(title: "Cirugia", description:"Cirugia de esterilizacion", start_time: Date.new(2022, 11, 20), end_time: Date.new(2022, 11, 20), pet: pet1, vet: vet1 )

app2 = Appointment.create!(title: "Revision", description:"Revision anual", start_time: Date.new(2022, 11, 29), end_time: Date.new(2022, 11, 29), pet: pet2, vet: vet1 )




puts "Seed creada"
