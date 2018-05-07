require 'rails_helper'

feature 'Sign up ', '
	I as guest can sign up to application
  with :first_name, :last_name, :email, :password
' do
	scenario '#Sign up' do
		user = {email: 'test1@gmail.com', password: 'test1@gmail.com'}
		sign_up(user)
		expect(page).to have_content "Welcome! You have signed up successfully."
	end
	scenario '#Sign up failer' do
		user = {email: nil, password: 'test1@gmail.com'}
		sign_up(user)
		expect(page).to have_content "Email can't be blank"
	end
end