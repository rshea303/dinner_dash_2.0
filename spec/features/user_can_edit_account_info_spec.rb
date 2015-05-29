require 'rails_helper'

describe "user" do

  it "can edit name" do
    user = User.create(username: "user", email: "user@example.com", password: "password")
    user_login(user)
    click_on("My Account")
    click_on("Edit Name")

    fill_in "Username", with: "updated_name"
    click_on("Submit")

    expect(page).to have_content("updated_name")
  end
end

def user_login(user)
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on("Submit")
end
