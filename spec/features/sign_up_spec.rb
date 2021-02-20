require 'rails_helper'

RSpec.describe 'SignUps', type: :feature do
  it 'after signing-up it should redirect the user to the app_tweets_path' do
    visit new_user_path
    fill_in 'Full name', with: 'John Doe'
    fill_in 'Username', with: 'username'
    fill_in 'Password', with: 'helloworld'
    click_button 'Create'

    expect(page).to have_current_path(app_tweets_path)
  end

  it 'takes the user to sign in page if the Sign in link is clicked' do
    visit new_user_path
    click_link 'Sign in'

    expect(page).to have_current_path(new_session_path)
  end
end
