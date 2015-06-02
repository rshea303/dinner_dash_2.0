require 'rails_helper'

describe "cart" do
  it "user can add items to cart" do
    visit menu_path 

    first(".item").click_link_or_button("Add to Cart")

    expect(page).to have_content("Cart: 1")
  end

  it "user can visit cart page" do
    visit '/' 
    click_link("Menu")
    first(".item").click_link_or_button("Add to Cart")
    click_on("Cart:")

    expect(page).to have_content("Cart Page")
  end

end
