require 'rails_helper'

feature 'Create Post', '
	I if login user can
	create posts
' do
	given(:user) { FactoryGirl.create(:user)}
	given(:category) { FactoryGirl.create(:category) }
	
	scenario '#Create post successful' do
		sign_in(user)
		name = "First. post"
		create_post(name)
		expect(page).to have_content 'Your post was successful created!'
	end
	
	describe '#Create post failer' do
		before(:each) do
			sign_in(user)
		end
		scenario 'nil field' do
			name = ""
			create_post(name)
			expect(page).to have_content 'Name can\'t be blank'
		end
		scenario 'length field' do
			name = "F"
			create_post(name)
			expect(page).to have_content 'Name please enter keywords in correct format'
		end
	end
end