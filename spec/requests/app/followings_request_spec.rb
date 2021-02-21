require 'rails_helper'

RSpec.describe 'App::Followings', type: :request do
  describe '#create' do
    it 'creates a follow relationship' do
      user = create(:user)
      another_user = create(:user)
      sign_in(user)
      post app_user_followings_path(another_user), params: nil

      expect(user.following?(another_user)).to be_truthy
    end
  end

  describe '#destroy' do
    it 'destroys the follow relationship' do
      user = create(:user)
      another_user = create(:user)
      user.follow(another_user)
      sign_in(user)
      delete app_following_path(another_user)

      expect(user.following?(another_user)).to be_falsy
    end
  end
end
