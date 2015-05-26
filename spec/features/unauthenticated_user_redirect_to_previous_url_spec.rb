require 'rails_helper'

describe "register redirects" do
  it "redirects to menu page" do
    visit menu_path

    click_on("Register")

    fill_in "user[username]", with: "register"
    fill_in "user[email]", with: "register@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on("Submit")

    expect(current_path).to eq(menu_path)
  end
  
  it "redirects to cart page" do
    visit menu_path
    first(".item").click_link_or_button("Add to Cart")
    click_on("Cart:")
    click_on("Place Order")
    
    within("#register") do
      click_on("Register")
    end

    fill_in "user[username]", with: "register"
    fill_in "user[email]", with: "register@example.com"
    fill_in "user[password]", with: "password"
    fill_in "user[password_confirmation]", with: "password"
    click_on("Submit")

    expect(current_path).to eq(cart_items_path)
  end

end
