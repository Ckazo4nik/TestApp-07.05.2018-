require 'rails_helper'

feature 'Delete category', '
	I as login user
	can delete category
' do
  given(:user) { FactoryGirl.create(:user) }
  scenario '#Delete category' do
    sign_in(user)
    create_category
    visit root_path
    click_on 'Delete'
    expect(page).to have_content 'Your category was successful deleted!'
  end
end
