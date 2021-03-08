# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

puts "Cleaning database..."

Task.destroy_all
Milestone.destroy_all
Post.destroy_all
Guildmembership.destroy_all
Guild.destroy_all
User.destroy_all

puts "Creating new users..."

jihye = User.new(first_name: "Jihye", last_name: "Kang", nickname: "Ji", email: "jihye@theguild.fun", password: "testtest")
daniele = User.new(first_name: "Daniele", last_name: "Argenti", nickname: "Dan", email: "daniele@theguild.fun", password: "testtest")
tom = User.new(first_name: "Toomas", last_name: "Arumae", nickname: "Tom", email: "tom@theguild.fun", password: "testtest")
john = User.new(first_name: "John", last_name: "Smith", nickname: "Johnny", email: "john@theguild.fun", password: "testtest")
jane = User.new(first_name: "Jane", last_name: "Smith", nickname: "Jan", email: "jane@theguild.fun", password: "testtest")

15.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nickname: Faker::Movies::HowToTrainYourDragon.dragon, email: Faker::Internet.email, password: "testtest")
end


puts "Creating new guilds..."

theguild = Guild.create!(name: "The Guild @ Le Wagon", description: "The Guild team at Le Wagon Batch #522", user: tom, category: "Education")
nottheguild = Guild.create!(name: "Not The Guild", description: "Test guild", user: john, category: "Gaming")

puts "Creating membership associations for the created guilds..."

Guildmembership.create(user: jihye, guild: theguild, admin: true)
Guildmembership.create(user: daniele, guild: theguild, admin: true)
Guildmembership.create(user: john, guild: theguild)

Guildmembership.create(user: jane, guild: nottheguild)

