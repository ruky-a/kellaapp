# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Category.create(name: "Front Office")


Category.where(name: "Reservations").first_or_create(name: "Reservations")
Category.where(name: "Sales").first_or_create(name: "Sales")
Category.where(name: "Food & Beverage").first_or_create(name: "Food & Beverage")
Category.where(name: "Marketing").first_or_create(name: "Marketing")
Category.where(name: "Housekeeping").first_or_create(name: "Housekeeping")
Category.where(name: "Revenue Management").first_or_create(name: "Revenue Management")
