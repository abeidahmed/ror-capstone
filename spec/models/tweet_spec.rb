require 'rails_helper'

RSpec.describe Tweet, type: :model do
  subject(:tweet) { build(:tweet) }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:text) }

    it { is_expected.to validate_length_of(:text).is_at_most(255) }
  end
end
