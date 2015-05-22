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
    it "sees a list of menu items" do
      visit root_path
      click_on("Menu")

      expect(page).to have_content("Pasta")
      expect(page).to have_content("Dessert")
    end
  end
end
