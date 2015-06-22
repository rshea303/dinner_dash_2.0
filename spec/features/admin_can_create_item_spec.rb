require 'rails_helper'

describe "admin items" do
  it "can create a category" do
    admin = User.create(username: "admin", email: "admin@example.com", password: "password", admin: true)
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: admin.email
    fill_in "session[password]", with: admin.password
    click_on("Submit")

    expect(page).to have_content("Admin Dashboard")

    click_on("Categories")

    click_on("Create New Category")

    fill_in"category[name]", with: "New Category"

    counter = Category.count
    click_on("Submit")

    expect(page).to have_content("New Category")
    expect(Category.count).to eq(counter + 1)
  end
end
