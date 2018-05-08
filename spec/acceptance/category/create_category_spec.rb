require 'rails_helper'

feature 'Create category', '
	I as login user
	can create category
' do
	given(:user) { FactoryGirl.create(:user) }
	scenario '#Create successful' do
		sign_in(user)
		create_category
		expect(page).to have_content 'Your category was successful create'
	end
end
