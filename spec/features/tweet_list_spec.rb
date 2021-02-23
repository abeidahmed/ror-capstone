require 'rails_helper'

RSpec.describe 'TweetLists', type: :feature do
  it 'lists all the tweets' do
    feature_sign_in
    tweet = create(:tweet, text: 'This is awesome')
    another_tweet = create(:tweet, text: 'Beautiful tweet')
    visit app_tweets_path

    expect(page).to have_text(tweet.text)
    expect(page).to have_text(another_tweet.text)
  end
end
