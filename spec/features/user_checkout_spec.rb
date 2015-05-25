require 'rails_helper'

describe "checkout" do
  it "an unauthenticated cannot checkout until they are logged in" do
    visit menu_path
    first(".item").click_link_or_button("Add to Cart")
    click_on("Cart:")
    
    expect(page).to have_content("Please login to place order.")
  end

  it "authenticated user can checkout" do
    new_user = User.create(username: "new_user", email: "new_user@example.com", password: "password") 
    visit '/'
    user_login(new_user)
    visit menu_path

    first(".item").click_link_or_button("Add to Cart")
    click_on("Cart:")
    click_on("Place Order")

    expect(current_path).to eq(user_orders_path(new_user.id))
  end
end

def user_login(user)
    click_on "Login"
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on("Submit")
end
