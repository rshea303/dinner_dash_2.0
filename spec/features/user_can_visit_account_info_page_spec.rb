require 'rails_helper'

describe "account info" do
  it "authenticated user can visit account info page" do
    new_user = User.create(username: "new_user",
                            email: "new_user@example.com",
                            password: "password"
                           )

    visit root_path
    expect(page).not_to have_content("My Account")

    user_login(new_user)

    expect(page).to have_content("My Account")
  end
end

def user_login(user)
    visit root_path
    click_on "Login"
    fill_in "session[email]", with: user.email
    fill_in "session[password]", with: user.password
    click_on("Submit")
end
