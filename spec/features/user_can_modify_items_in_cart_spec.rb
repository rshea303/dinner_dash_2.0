require 'rails_helper'

describe "cart updates" do
  def create_item
    category = Category.create(name: "new category")
    category.items.create(name: "new item", description: "desc", price: 5000)
  end

  it "can decrease item quantity" do
    create_item
    new_user = User.create(username: "new_user", email: "new_user@example.com", password: "password")
    visit menu_path
    first(".item").click_link_or_button("Add to Cart")
    first(".item").click_link_or_button("Add to Cart")
    click_on("Cart:")

    within("table") do
      expect(page).to have_content("2")
    end

    click_on("-")

    within("table") do
      expect(page).to have_content("1")
    end
  end

  it "can increase item quantity" do
    create_item
    new_user = User.create(username: "new_user", email: "new_user@example.com", password: "password")
    visit menu_path
    first(".item").click_link_or_button("Add to Cart")
    click_on("Cart:")

    within("table") do
      expect(page).to have_content("1")
    end

    click_on("+")

    within("table") do
      expect(page).to have_content("2")
    end
  end

  it "can delete item in cart" do
    create_item
    new_user = User.create(username: "new_user", email: "new_user@example.com", password: "password")
    visit menu_path
    first(".item").click_link_or_button("Add to Cart")
    click_on("Cart:")

    within("table") do
      expect(page).to have_content("1")
    end

    click_on("Remove")

    expect(page).to have_content("Cart is empty")
  end
end
