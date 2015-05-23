require 'rails_helper'

describe "user logout" do
  it "user can logout" do
    user = User.create(username: "new_user", email: "new_user@example.com", password: "password")
    user_login(user)
    
    expect(page).to have_selector(:link_or_button, "Logout")
    expect(page).not_to have_link("Login")

    click_on("Logout")

    expect(page).not_to have_link("Logout")
    expect(page).to have_link("Login")
  end
end

def user_login(user)
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on("Submit")
end
