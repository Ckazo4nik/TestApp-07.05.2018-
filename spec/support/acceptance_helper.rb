module AcceptanceHelper
  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_on 'Log in'
  end

  def sign_up(user)
    visit new_user_registration_path
    fill_in 'Email', with: user[:email]
    fill_in 'First name', with: user[:first_name]
    fill_in 'Last name', with: user[:last_name]
    fill_in 'Password', with: user[:password]
    fill_in 'Password confirmation', with: user[:password]
    click_on 'Sign up'
  end

  def create_post(name="First. post")
    create_category
    visit root_path
    click_on 'Category. first'
    click_on 'Create Post'
    fill_in 'Name', with: name
    fill_in 'Content', with: 'First Post bla bla bla'
    click_on 'Save post'
  end
  def create_category(name="Category. first")
    visit root_path
    click_on 'Create Category'
    fill_in "Name", with: name
    fill_in "Description", with: 'Description'
    click_on "Create"
  end
end
