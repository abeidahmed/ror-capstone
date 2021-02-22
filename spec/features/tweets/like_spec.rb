require 'rails_helper'

RSpec.describe 'Tweets::Likes', type: :feature do
  it 'likes the tweet' do
    create(:tweet)
    feature_sign_in
    visit app_tweets_path
    click_button(id: 'react-button')

    within '#react-button' do
      expect(page).to have_text(1)
    end
  end
end
