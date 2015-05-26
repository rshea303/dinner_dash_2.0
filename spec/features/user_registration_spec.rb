require 'rails_helper'

describe "registration process" do
  it "user can register" do
    visit root_path
    click_on("Register")
    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "username"
    fill_in "user[email]", with: "user@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on("Submit")

    user = User.last

    expect(user.username).to eq("username")
    expect(user.email).to eq("user@example.com")
  end

  it "new user is automatically logged in" do
    visit root_path
    click_on("Register")
    expect(current_path).to eq(new_user_path)

    fill_in "user[username]", with: "username"
    fill_in "user[email]", with: "user@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on("Submit")
    
    expect(current_path).to eq(root_path)
    expect(page).to have_content("Welcome, Username!")
  end

end
