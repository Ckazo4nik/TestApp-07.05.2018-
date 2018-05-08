require 'rails_helper'

feature 'Delete post', '
	I as login user
	can delete my post
' do
  given(:user) { FactoryGirl.create(:user) }
  given(:user2) { FactoryGirl.create(:user) }
  scenario '#Delete post' do
    sign_in(user)
    post = FactoryGirl.create(:post, user_id: user.id)
    visit root_path
    click_on 'Delete'
    expect(page).to have_content 'Your post was successful deleted!'
  end
  scenario '#Delete post' do
    sign_in(user)
    post = FactoryGirl.create(:post, user_id: user2.id)
    # create_post('sdfasdf')
    visit root_path
    expect(page).to_not have_content 'delete'
  end
end
