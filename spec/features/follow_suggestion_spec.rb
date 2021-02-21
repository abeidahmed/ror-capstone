require 'rails_helper'

RSpec.describe 'FollowSuggestions', type: :feature do
  it 'does not list the current user' do
    user = create(:user, full_name: 'David')
    another_user = create(:user, full_name: 'Michael')
    feature_sign_in(user)
    visit app_tweets_path

    within '#follow-suggestion' do
      expect(page).to have_text(another_user.full_name)
      expect(page).not_to have_text(user.full_name)
    end
  end

  it 'follows the other user' do
    user = create(:user, full_name: 'David')
    another_user = create(:user, full_name: 'Michael')
    feature_sign_in(user)
    visit app_tweets_path

    within '#follow-suggestion' do
      expect(page).to have_text(another_user.full_name)

      click_button 'Follow'

      expect(page).to have_button('Unfollow')
    end
  end
end
