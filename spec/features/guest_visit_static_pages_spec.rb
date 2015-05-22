require 'rails_helper'

describe "guest visit" do 
  context "landing page" do
    it "sees a login and register button" do
      visit root_path

      expect(page).to have_selector(:link_or_button, 'Login')
      expect(page).to have_selector(:link_or_button, 'Register')
    end
  end

  context "menu page" do
    it "sees a list of menu categories" do
      visit root_path
      click_on("Menu")

      expect(page).to have_content("Pasta")
      expect(page).to have_content("Dessert")
    end

    it "see a list of menu items for each each category" do
      pasta = Category.create(name: "Pasta")
      pasta.items.create(name: "Spaghetti", description: "tasty spaghetti", price: 1200)
      pasta.items.create(name: "Meatballs", description: "tasty meatballs", price: 1500)

      dessert = Category.create(name: "Dessert")
      dessert.items.create(name: "Ice Cream", description: "tasty ice cream", price: 1000)

      visit menu_path      

      expect(page).to have_content("Spaghetti")
      expect(page).to have_content("tasty meatballs")
      expect(page).to have_content("$10.00")
    end
  end
end
