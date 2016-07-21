# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new(firstname: "Jackie", lastname: "Lang", email: "jbarlang@gmail.com", is_admin: true)
admin.password = "believe94"
admin.save!

20.times do
  user = User.new(firstname: Faker::Name.first_name, lastname: Faker::Name.last_name, is_admin: false)
  user.email = Faker::Internet.free_email(user.firstname)
  user.password = "password"
  user.save!
end

Movie.create!(title: "Star Wars: The Force Awakens", 
           director: "J.J. Abrams",
 runtime_in_minutes: 135,
       release_date: DateTime.new(2015, 12, 18))

Movie.create!(title: "Forrest Gump", 
           director: "Robert Zemeckis",
 runtime_in_minutes: 155,
       release_date: DateTime.new(1994, 6, 23))

Movie.create!(title: "Rocky", 
           director: "John G. Avildsen",
 runtime_in_minutes: 122,
       release_date: DateTime.new(1976, 11, 21))

Movie.create!(title: "Moulin Rouge", 
           director: "Baz Luhrmann",
 runtime_in_minutes: 130,
       release_date: DateTime.new(2001, 5, 18))

Movie.create!(title: "Love Actually", 
           director: "Richard Curtis",
 runtime_in_minutes: 136,
       release_date: DateTime.new(2003, 11, 6))

