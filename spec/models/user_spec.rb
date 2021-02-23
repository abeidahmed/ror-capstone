require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'association' do
    it { is_expected.to have_many(:tweets).with_foreign_key(:author_id).dependent(:destroy) }

    it { is_expected.to have_many(:active_followings).with_foreign_key(:follower_id).dependent(:destroy) }

    it { is_expected.to have_many(:followings).through(:active_followings) }

    it { is_expected.to have_many(:passive_followings).with_foreign_key(:followed_id).dependent(:destroy) }

    it { is_expected.to have_many(:followers).through(:passive_followings) }
  end

  describe 'validations' do
    it { is_expected.to have_secure_password }

    it { is_expected.to validate_presence_of(:username) }

    it { is_expected.to validate_length_of(:username).is_at_most(255) }

    it { is_expected.to validate_presence_of(:full_name) }

    it { is_expected.to validate_length_of(:full_name).is_at_most(255) }

    it { is_expected.to validate_length_of(:password).is_at_least(6) }

    it 'lowercase username before saving' do
      username = 'helloexamplecom'
      user.username = username.upcase
      user.save!

      expect(user.username).to eq(username)
    end

    it 'strips the username before validation' do
      username = '   helloexamplecom '
      user.username = username
      user.save!

      expect(user.username).to eq('helloexamplecom')
    end

    it 'generates user auth_token at random' do
      user.auth_token = nil
      user.save!

      expect(user.auth_token).to be_present
    end
  end

  describe '#follow' do
    it 'follows other user' do
      user = create(:user)
      another_user = create(:user)
      user.follow(another_user)

      expect(user.followings.map(&:id)).to match_array([another_user.id])
    end
  end

  describe '#unfollow' do
    it 'destroys the following record' do
      user = create(:user)
      another_user = create(:user)
      user.follow(another_user)
      user.unfollow(another_user)

      expect(user.followings.count).to be_zero
    end
  end

  describe '#following?' do
    it 'returns true if user is following other user' do
      user = create(:user)
      another_user = create(:user)
      user.follow(another_user)

      expect(user.following?(another_user)).to be_truthy
    end

    it 'returns false if user is not following other user' do
      user = create(:user)
      another_user = create(:user)

      expect(user.following?(another_user)).to be_falsy
    end
  end

  describe '#not_following_users' do
    it 'returns all the users that are not followed by the users' do
      user = create(:user)
      another_user = create(:user)

      expect(user.not_following_users.map(&:id)).to match_array([another_user.id])
    end

    it 'does not return followed users' do
      user = create(:user)
      another_user = create(:user)
      user.follow(another_user)

      expect(user.not_following_users.map(&:id)).to match_array([])
    end
  end
end
