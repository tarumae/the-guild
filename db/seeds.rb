# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning database..."

Task.destroy_all
Milestone.destroy_all
Post.destroy_all
Guildmembership.destroy_all
Guild.destroy_all
User.destroy_all

puts "Creating new users..."

jihye = User.new(email: "jihye@theguild.fun", password: "testtest")
daniele = User.new(email: "daniele@theguild.fun", password: "testtest")
tom = User.new(email: "tom@theguild.fun", password: "testtest")
john = User.new(email: "john@theguild.fun", password: "testtest")
jane = User.new(email: "jane@theguild.fun", password: "testtest")

puts "Creating new guilds..."

theguild = Guild.create!(name: "The Guild @ Le Wagon", description: "The Guild team at Le Wagon Batch #522", user: tom, category: "Education")
nottheguild = Guild.create!(name: "Not The Guild", description: "Test guild", user: john, category: "Gaming")

puts "Creating membership associations for the created guilds..."

Guildmembership.create(user: jihye, guild: theguild, admin: true)
Guildmembership.create(user: daniele, guild: theguild, admin: true)
Guildmembership.create(user: john, guild: theguild)
Guildmembership.create(user: jane, guild: nottheguild)