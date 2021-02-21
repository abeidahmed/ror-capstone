FactoryBot.define do
  factory :user, aliases: %i[author follower followed] do
    sequence(:username) { |n| "user#{n}" }
    full_name { 'John Doe' }
    photo { 'https://hello.com' }
    cover_image { 'https://hello.com' }
    password { 'mysecretpassword' }
    auth_token { 'helloworld' }
  end
end
