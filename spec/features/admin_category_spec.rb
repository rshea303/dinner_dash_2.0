require 'rails_helper'

describe "admin category" do
  it "can create a category" do
    admin_login  

    expect(page).to have_content("Admin Dashboard")

    click_on("Categories")
    click_on("Create New Category")
    fill_in"category[name]", with: "New Category"
    counter = Category.count
    click_on("Submit")

    expect(page).to have_content("New Category")
    expect(Category.count).to eq(counter + 1)
    expect(page).to have_content("New Category successfully created!")
  end

  it "can edit a category" do
    Category.create(name: "New Category")
    admin_login

    click_on("Categories")
    click_on("Edit")

    fill_in "category[name]", with: "updated name"
    click_on("Update Category")

    expect(page).to have_content("updated name")
  end

  it "can delete a category" do
    Category.create(name: "Destroy This Category")
    admin = User.create(username: "admin", email: "admin@example.com", password: "password", admin: true)
    admin_login

    click_on("Categories")
    counter = Category.count
    click_on("Delete")

    expect(page).not_to have_content("Destroy This Category")
    expect(Category.count).to eq(counter - 1)
  end
  
  def admin_login
    admin = User.create(username: "admin", email: "admin@example.com", password: "password", admin: true)
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: admin.email
    fill_in "session[password]", with: admin.password
    click_on("Submit")
  end

end
