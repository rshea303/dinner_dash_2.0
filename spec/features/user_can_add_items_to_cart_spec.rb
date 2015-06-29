require 'rails_helper'

describe "cart" do
  it "user can add items to cart" do
    category = Category.create(name: "new category")
    item = category.items.create(name: "new item", description: "desc", price: 5000)

    visit menu_path 

    first(".item").click_link_or_button("Add to Cart")

    expect(page).to have_content("Cart: 1")
    expect(page).to have_content("#{item.name} added to cart.")
  end

  it "user can visit cart page" do
    category = Category.create(name: "new category")
    category.items.create(name: "new item", description: "desc", price: 5000)

    visit '/' 

    click_link("Menu")
    first(".item").click_link_or_button("Add to Cart")
    click_on("Cart:")

    expect(page).to have_content("Cart Page")
  end

end
