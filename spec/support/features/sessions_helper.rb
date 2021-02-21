module Features
  module SessionsHelper
    def feature_sign_in(user = nil)
      user ||= create(:user)
      visit new_session_path
      fill_in 'username', with: user.username
      fill_in 'password', with: user.password
      click_button 'Sign'
    end
  end
end
