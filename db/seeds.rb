# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
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
jackson = User.new(first_name: "Paul", last_name: "Jackson", nickname: "Paarthurnax", email: "jackson@theguild.fun", password: "testtest")
martin = User.new(first_name: "Martin", last_name: "Greenwood", nickname: "Bimror", email: "greenwood@theguild.fun", password: "testtest")
connor = User.new(first_name: "Connor", last_name: "Piper", nickname: "Quldreg", email: "piper@theguild.fun", password: "testtest")
giovanni = User.new(first_name: "Giovanni", last_name: "Blundell", nickname: "Elrodyr", email: "blundell@theguild.fun", password: "testtest")
amy = User.new(first_name: "Amy", last_name: "Blackwell", nickname: "Liry", email: "blackwell@theguild.fun", password: "testtest")
ellie = User.new(first_name: "Ellie", last_name: "Howells", nickname: "Gyripho", email: "howells@theguild.fun", password: "testtest")
annie = User.new(first_name: "Annie", last_name: "Mclean", nickname: "Ranyssy", email: "mclean@theguild.fun", password: "testtest")
15.times do
  User.create(first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, nickname: Faker::Movies::HowToTrainYourDragon.dragon, email: Faker::Internet.email, password: "testtest")
end

User.create(first_name: "Sharon", last_name: "Smith", nickname: "Shar", email: "sharon@theguild.fun", password: "testtest")

daniele.photo.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1615389040/daniele_qoyay6.jpg'),filename: 'daniele_qoyay6.jpg', content_type: 'image/jpeg')
jihye.photo.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1615389040/jihye_qsolgg.jpg'),filename: 'jihye_qsolgg.jpg', content_type: 'image/jpeg')
tom.photo.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1615389041/tom_rvipta.jpg'),filename: 'tom_rvipta.jpg', content_type: 'image/jpeg')
jackson.photo.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1615383200/jackson_txprxq.png'),filename: 'jackson_txprxq.png', content_type: 'image/png')
giovanni.photo.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1615383328/giovanni_f8bied.png'),filename: 'giovanni_f8bied.png', content_type: 'image/png')
ellie.photo.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1615383329/ellie_sckh0k.png'),filename: 'ellie_sckh0k.png', content_type: 'image/png')
puts "Creating new guilds..."

theguild = Guild.create!(name: "The Guild @ Le Wagon", description: "The Guild team at Le Wagon Batch #522", user: daniele, category: "Education")
nottheguild = Guild.create!(name: "Not The Guild", description: "Test guild", user: john, category: "Gaming")
madhouse = Guild.create!(name: "MadHouse", description: "The MadHouse gaming clan", user: jackson, category: "Gaming")
madhouse.photo.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1615381955/madhouse_w6zfao.png'),filename: 'madhouse_w6zfao.png', content_type: 'image/png')
theguild.photo.attach(io: URI.open('https://res.cloudinary.com/dx6rtf9wl/image/upload/v1615383566/guild_IP-Banner_xytmhl.jpg'),filename: 'guild_IP-Banner_xytmhl.jpg', content_type: 'image/jpeg')

puts "Creating membership associations for the created guilds..."

Guildmembership.create(user: jihye, guild: theguild, admin: true, status: "approved")
Guildmembership.create(user: tom, guild: theguild, admin: true, status: "approved")
Guildmembership.create(user: jane, guild: nottheguild, status: "approved")
Guildmembership.create(user: martin, guild: madhouse, admin: true, status: "approved")
Guildmembership.create(user: connor, guild: madhouse, status: "approved")
Guildmembership.create(user: giovanni, guild: madhouse, status: "approved")
Guildmembership.create(user: amy, guild: madhouse, status: "approved")
Guildmembership.create(user: ellie, guild: madhouse, status: "approved")
Guildmembership.create(user: annie, guild: madhouse, status: "approved")
Guildmembership.create(user: tom, guild: madhouse)

puts "Creating milestones..."

tgmilestone = Milestone.create(title: "The application", description: "Finish the application!", deadline: "Fri, 12 Mar 2021", reward: "Eternal Glory", guild: theguild )

puts "Creating tasks..."

Task.create(title: "Landing page", description: "Add images to the landing page", milestone: tgmilestone, user: tom, completed: true)
Task.create(title: "Bugfixing", description: "Fix the bugs on the log-in page", milestone: tgmilestone, user: daniele, completed: true)
Task.create(title: "Presentation", description: "Prepare for the presentation", milestone: tgmilestone, user: tom)
Task.create(title: "Design buttons", description: "Find a cool design for the buttons", milestone: tgmilestone, user: jihye, completed: true)
Task.create(title: "Footer", description: "Make an awesome footer for the app", milestone: tgmilestone, user: daniele, completed: true)
Task.create(title: "Features", description: "Think of more features to add!", milestone: tgmilestone, user: jihye)


puts "Creating posts.."

Post.create(user: jackson, guild: madhouse, content: "Created a guild for us to chat and keep track of stuff. Let me know how ya like it!")
Post.create(user: martin, guild: madhouse, content: "It looks pretty cool, need to check out all the other stuff it allows us to do.")
Post.create(user: annie, guild: madhouse, content: "OMG! I LOVE THE LITTLE CROWNS IN THE MEMBER LIST!")
Post.create(user: ellie, guild: madhouse, content: "This is pretty nifty isn't it!")
Post.create(user: daniele, guild: theguild, content: "The guild is now up and running!")
Post.create(user: jihye, guild: theguild, content: "This is so cool!")
Post.create(user: tom, guild: theguild, content: "Loving it!")
Post.create(user: daniele, guild: theguild, content: "Don't forget to tick off your tasks in the milestone once you've done them!")
Post.create(user: jackson, guild: madhouse, content: "Guys 'n gals, how do you feel about playing some Among Us later today?")
Post.create(user: giovanni, guild: madhouse, content: "Sounds good to me!")
Post.create(user: martin, guild: madhouse, content: "yeah i'll defo be there")
Post.create(user: connor, guild: madhouse, content: "Haven't played Among Us in ages. Sounds like a plan. I'm free after 8 PM.")
Post.create(user: ellie, guild: madhouse, content: "Absolutely! Count me in.")
Post.create(user: amy, guild: madhouse, content: "Uhhh... Guys how do I sabotage as an impostor?")