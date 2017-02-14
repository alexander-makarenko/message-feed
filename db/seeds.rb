# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def lorem_sentence
  Faker::Lorem.sentence(rand(20..30), true)
end

def random_user
  User.find(rand(User.count) + 1)
end

def random_message
  Message.find(rand(Message.count) + 1)
end

images_path, samples_path = File.join('app', 'assets', 'images'), 'identicon-samples'

Dir.foreach(File.join(images_path, samples_path)) do |entry|
  next if File.directory?(entry)
  User.create!(name: Faker::Name.name, email: Faker::Internet.safe_email, avatar_url: File.join(samples_path, entry))
end

18.times { random_user.messages.create!(body: lorem_sentence) }
40.times { random_user.messages.create!(body: lorem_sentence, parent_id: random_message) }