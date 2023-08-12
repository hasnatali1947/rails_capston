require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  describe 'sign in page' do
    scenario 'redirects to the groups path after sign in' do
      user = FactoryBot.create(:user)
      visit new_user_session_path

      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(current_path).to eq(groups_path)
    end
    scenario 'should have a sign up link' do
      visit new_user_session_path
      expect(page).to have_link('Sign up')
    end
    scenario 'should have a forgot password link' do
      visit new_user_session_path
      expect(page).to have_link('Forgot your password?')
    end
  end
  describe 'sign up page' do
    scenario 'should have a sign up page' do
      visit new_user_registration_path
      expect(page).to have_content('Log in')
    end
    scenario 'should have a sign up button' do
      visit new_user_registration_path
      expect(page).to have_button('Sign up')
    end
  end
  describe 'forgot password page' do
    it 'should have a forgot password page' do
      visit new_user_password_path(group_id: @user)
      expect(page).to have_content('Log in')
    end
  end
end
