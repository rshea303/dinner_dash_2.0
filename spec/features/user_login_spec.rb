require 'rails_helper'

describe "login" do
  it "user can login" do
    new_user = User.create(username: "new_user", email: "new_user@example.com", password: "password")

    visit root_path
    click_on "Login"
    fill_in "session[email]", with: new_user.email
    fill_in "session[password]", with: new_user.password 
    click_on("Submit")

    expect(page).to have_content("Welcome, New_user!")
  end

  xit "redirects to previous page after login" do
    
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

def user_login(user)
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on("Submit")
end
