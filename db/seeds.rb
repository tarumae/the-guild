# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


john = User.create!(email: "john@john.com", password: "testtest")

guild1 = Guild.new(name: "The Horde", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", category: "Family")
guild1.user = john
guild1.save

milestone1 = Milestone.new(title: "milestone", description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.", deadline: "2021-04-08")
milestone1.guild = guild1
milestone1.save
