require 'rails_helper'

describe "account info" do
  it "user can see My Account info link after logging in" do
    new_user = User.create(username: "new_user",
                           email: "new_user@example.com",
                           password: "password"
                          )

    visit root_path
    expect(page).not_to have_content("My Account")

    user_login(new_user)

    expect(page).to have_content("My Account")
  end

  it "authenticated user can see account info page" do
    new_user = User.create(username: "new_user",
                           email: "new_user@example.com",
                           password: "password"
                          )

    visit root_path
    user_login(new_user)
    click_on("My Account")
    expect(current_path).to eq(user_path(new_user.id))

    expect(page).to have_content("#{new_user.username}")
    expect(page).to have_content("#{new_user.email}")
    expect(page).to have_content("Order History")
  end
end

def user_login(user)
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on("Submit")
end
