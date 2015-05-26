require 'rails_helper'

describe "cart updates" do
  xit "can decrease item quantity" do
  end

  it "can increase item quantity" do
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

  xit "can delete item in cart" do
  end
end
