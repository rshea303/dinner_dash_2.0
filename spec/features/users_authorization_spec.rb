require 'rails_helper'

describe "an unauthenticated user" do

  def create_item
    category = Category.create(name: "new category")
    category.items.create(name: "new item", description: "desc", price: 5000)
  end

  it "cannot visit a users orders page" do
    create_item
    new_user = User.create(username: "new_user", email: "new_user@example.com", password: "password")

    user_login(new_user)
    visit menu_path

    first(".item").click_link_or_button("Add to Cart")
    click_on("Cart:")
    click_on("Place Order")
    click_on("Logout")
    
    visit user_orders_path(new_user.id)
    expect(current_path).to eq(new_session_path)

    new_user2 = User.create(username: "new_user2", email: "new_user2@example.com", password: "password")
    user_login(new_user2)

    visit user_orders_path(new_user.id)

    expect(page).to have_content("Unauthorized access!")
  end
  
  it "cannot visit a users account page" do
    new_user = User.create(username: "new_user", email: "new_user@example.com", password: "password")

    visit user_path(new_user.id)

    expect(current_path).to eq(new_session_path)
    expect(page).to have_content("Please log in first.")
  end

end
