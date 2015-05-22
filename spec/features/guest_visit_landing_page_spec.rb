require 'rails_helper'

describe "guest visit landing" do 
  it "sees a login and register button" do
    visit root_path

    expect(page).to have_selector(:link_or_button, 'Login')
    expect(page).to have_selector(:link_or_button, 'Register')
  end
end
