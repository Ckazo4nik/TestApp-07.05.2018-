require 'rails_helper'

feature 'Update category', '
	I as login user can
	edit category
' do
  given(:user) { FactoryGirl.create(:user) }
  given(:user2) { FactoryGirl.create(:user) }
  scenario '#Update category successful' do
    sign_in(user)
    create_category("Name")
    visit root_path
    click_on 'Edit'
    fill_in 'Name', with: 'Test3'
    click_on 'Save Category'
    expect(page).to have_content 'Your category was successful updated!'
  end
  describe '#Update category failed' do
    scenario 'field is nil' do
      sign_in(user)
      create_category("Name")
      visit root_path
      click_on 'Edit'
      fill_in 'Name', with: nil
      click_on 'Save Category'
      expect(page).to have_content "Name can\'t be blank"
    end
  end
end
