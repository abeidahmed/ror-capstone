require 'rails_helper'

RSpec.describe 'UserShows', type: :feature do
  it 'lists all the users tweets' do
    user = create(:user)
    tweet = create(:tweet, text: 'hello', author: user)
    another_tweet = create(:tweet, text: 'another tweet', author: user)
    feature_sign_in(user)
    visit app_user_path(user)

    within '#user-tweet-list' do
      expect(page).to have_text(tweet.text)
      expect(page).to have_text(another_tweet.text)
    end
  end

  it 'lists all the users that follows the user' do
    user = create(:user)
    another_user = create(:user)
    another_user.follow(user)
    feature_sign_in(user)
    visit app_user_path(user)

    within '#user-followers' do
      expect(page).to have_text(another_user.full_name)
    end
  end

  it 'lists all the users that user is following' do
    user = create(:user)
    another_user = create(:user)
    user.follow(another_user)
    feature_sign_in(user)
    visit app_user_path(user)

    within '#user-followings' do
      expect(page).to have_text(another_user.full_name)
    end
  end
end
