require 'rails_helper'

feature 'Create Post', '
	I if login user can
	create posts
' do
	given(:user) { FactoryGirl.create(:user)}
	
	scenario '#Create post successful' do
		sign_in(user)
		visit root_path
		click_on 'Create Post'
		fill_in 'Name', with: 'First Post'
		fill_in 'Content', with: 'First Post bla bla bla'
		click_on 'Create post'
		
		expect(page).to have_content 'Your post was successful created!'
	end
	
	describe '#Create post failer' do
		before(:each) do
			sign_in(user)
		end
		scenario 'nil field' do
			visit root_path
			click_on 'Create Post'
			fill_in 'Name', with: nil
			fill_in 'Content', with: 'First Post bla bla bla'
			click_on 'Create post'
			
			expect(page).to have_content 'Name can\'t be blank'
		end
		scenario 'length field' do
			visit root_path
			click_on 'Create Post'
			fill_in 'Name', with: 'n'
			fill_in 'Content', with: 'First Post bla bla bla'
			click_on 'Create post'
			
			expect(page).to have_content 'Your post was successful created!'
		end
	end
end