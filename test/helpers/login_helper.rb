module LoginHelper
  def login(user)
    visit '/'

    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password

    click_button 'Log in'
  end
end
