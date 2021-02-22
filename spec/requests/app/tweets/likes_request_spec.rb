require 'rails_helper'

RSpec.describe 'App::Tweets::Likes', type: :request do
  describe '#create' do
    it 'should like the tweet if the user has not liked it already' do
      tweet = create(:tweet)
      sign_in
      post app_tweet_likes_path(tweet), params: nil

      expect(tweet.get_upvotes.size).to eq(1)
    end

    it 'should remove the like if the user has already liked it' do
      user = create(:user)
      tweet = create(:tweet)
      user.likes(tweet)
      sign_in(user)
      post app_tweet_likes_path(tweet), params: nil

      expect(tweet.reload.get_upvotes.size).to be_zero
    end
  end
end
