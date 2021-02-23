require 'rails_helper'

RSpec.describe 'LandingPages', type: :feature do
  it 'has a get started link to sign up page' do
    visit root_path
    click_link 'Get started'

    expect(page).to have_current_path(new_user_path)
  end

  it 'has a sign in link to sign in page' do
    visit root_path
    click_link 'Sign in'

    expect(page).to have_current_path(new_session_path)
  end
end
