require 'rails_helper'

RSpec.describe 'SignIns', type: :feature do
  it 'after signing-in it should redirect the user to the tweet path' do
    user = create(:user)
    visit new_session_path
    fill_in 'Username', with: user.username
    fill_in 'Password', with: user.password
    click_button 'Sign in'

    expect(page).to have_current_path(app_tweets_path)
  end

  it 'takes the user to sign up page if the Sign up link is clicked' do
    visit new_session_path
    click_link 'Sign up'

    expect(page).to have_current_path(new_user_path)
  end
end
