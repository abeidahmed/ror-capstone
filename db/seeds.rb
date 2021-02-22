# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

10.times do
  user = User.create! username: Faker::Internet.unique.username, full_name: Faker::Name.name, password: 'super_secret'

  5.times do
    tweet = user.tweets.create! text: Faker::Quote.famous_last_words
    tweet.liked_by(user)
  end
end
