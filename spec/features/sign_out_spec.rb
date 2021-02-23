require 'rails_helper'

RSpec.describe 'SignOuts', type: :feature do
  it 'redirects the user to sign in page after logging out' do
    feature_sign_in
    visit app_tweets_path
    within '#user-options', visible: false do
      click_link 'Sign out', visible: false
    end

    expect(page).to have_current_path(new_session_path)
  end
end
