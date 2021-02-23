require 'rails_helper'

RSpec.describe 'TweetNews', type: :feature do
  it 'redirects to same page after creating the tweet' do
    feature_sign_in
    visit app_tweets_path
    within '#tweet-form' do
      fill_in 'tweet[text]', with: 'hello world'
      click_button 'Tweet'
    end

    expect(page).to have_current_path(app_tweets_path)
  end
end
