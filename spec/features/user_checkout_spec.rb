require 'rails_helper'

describe "checkout" do
  it "an unauthenticated cannot checkout until they are logged in" do
    visit menu_path
    first(:button, "Add to Cart").click
    click_on("Cart:")
    click_on("Place Order")
    
    expect(page).to have_content("To place an order you must be signed in")
  end

  xit "authenticated user can checkout" do
  end
end
