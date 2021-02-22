10.times do
  user = User.create! username: Faker::Internet.unique.username, full_name: Faker::Name.name, password: 'super_secret'

  User.all.each do |u|
    next if user == u

    user.follow(u)
  end

  3.times do
    tweet = user.tweets.create! text: Faker::Quote.famous_last_words
    tweet.liked_by(user)
  end
end
