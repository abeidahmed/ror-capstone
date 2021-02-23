require 'rails_helper'

RSpec.describe 'App::Tweets', type: :request do
  describe '#create' do
    it 'creates a tweet' do
      user = create(:user)
      sign_in(user)
      post app_tweets_path, params: { tweet: { text: 'hello world' } }

      expect(user.tweets.count).to eq(1)
    end

    it 'renders error if request is invalid' do
      user = create(:user)
      sign_in(user)
      post app_tweets_path, params: { tweet: { text: '' } }

      expect(json.dig(:errors, :text)).to be_present
    end
  end
end
