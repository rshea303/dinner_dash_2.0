require 'rails_helper'

describe "login" do
  it "user can login" do
    user_register

    visit root_path
    click_on "Login"
    fill_in "session[email]", with: "user@example.com"
    fill_in "session[password]", with: "password"
    click_on("Submit")

    expect(page).to have_content("Welcome, Username!")
  end
end

def user_register
    visit root_path
    click_on("Register")

    fill_in "user[username]", with: "username"
    fill_in "user[email]", with: "user@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on("Submit")
end
