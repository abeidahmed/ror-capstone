FactoryBot.define do
  factory :user do
    sequence(:user_name){ |n| "user#{n}" }
    full_name { 'John Doe' }
    photo { 'https://hello.com' }
    cover_image { 'https://hello.com' }
    password { 'mysecretpassword' }
    auth_token { 'helloworld' }
  end
end
