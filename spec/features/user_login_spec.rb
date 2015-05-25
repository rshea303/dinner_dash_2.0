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

  xit "redirects to previous page after login" do
    user_register
    
    visit menu_path
    first(:button, "Add to Cart").click
    click_on("Cart:")
    click_on("Place Order")

    expect(page).to have_content("Please login to proceed")
    expect(current_path).to eq(new_session_path) 

    fill_in "session[email]", with: "user@example.com"
    fill_in "session[password]", with: "password"
    click_on("Submit")
    
    expect(current_path).to eq(cart_items_path)
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

def user_login
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: "user@example.com"
    fill_in "session[password]", with: "password"
    click_on("Submit")
end
