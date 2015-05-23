require 'rails_helper'

describe "cart" do
  it "user can add items to cart" do
    visit menu_path
    first(:button, "Add to Cart").click

    expect(page).to have_content("Cart: 1")
  end
end
