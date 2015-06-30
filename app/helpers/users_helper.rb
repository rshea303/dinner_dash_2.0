module UsersHelper
  def user_login(user)
      visit root_path
      click_on "Login"
      fill_in "session[email]", with: user.email
      fill_in "session[password]", with: user.password
      click_on("Submit")
  end
end
