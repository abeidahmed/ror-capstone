require 'rails_helper'

RSpec.describe User, type: :model do
  subject(:user) { build(:user) }

  describe 'association' do
    it { is_expected.to have_many(:tweets).with_foreign_key(:author_id).dependent(:destroy) }
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
end
