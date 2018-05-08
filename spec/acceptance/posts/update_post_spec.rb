require 'rails_helper'

feature 'Update post', '
	I as login user can
	edit my post
' do
  given(:user) { FactoryGirl.create(:user) }
  given(:user2) { FactoryGirl.create(:user) }
  scenario '#Update post successful' do
    sign_in(user)
    create_post('sdfasdf')
    click_on 'Edit'
    fill_in 'Name', with: 'Test3'
    click_on 'Save post'
    expect(page).to have_content 'Your post was successful updated!'
  end
  describe '#Update post failed' do
    scenario 'not visible link' do
	    sign_in(user)
      create_post
	    visit root_path
      expect(page).to_not have_link 'Edit'
    end
    scenario 'field is nil' do
      sign_in(user)
      create_post
      click_on 'Edit'
      fill_in 'Name', with: nil
      click_on 'Save post'
      expect(page).to have_content "Name can\'t be blank"
    end
  end
end
