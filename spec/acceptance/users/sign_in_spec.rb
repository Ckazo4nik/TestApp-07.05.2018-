require 'rails_helper'

feature 'Sign in', '
	I if sign up user
	can Log in this application
' do
	given(:user) { FactoryGirl.create(:user) }
	scenario '#Sign in' do
		sign_in(user)
		expect(page).to have_content 'Signed in successfully.'
	end
	scenario '#Sign in' do
		visit new_user_session_path
		fill_in 'Email', with: user.email
		fill_in 'Password', with: nil
		click_on 'Log in'
		expect(page).to have_content 'Invalid Email or password.'
	end
end