require 'test_helper'

class UserRegistrationTest < ActionDispatch::IntegrationTest
  test "a user can register on the site" do
    visit '/'
    click_link "Register"
    fill_in "Email",    with: "nick@example.com"
    fill_in "Password", with: "secret"
    click_button "Register"

    assert page.has_content? "Activate via email"
    open_email "nick@example.com"
    current_email.click_link "Activate your account"
    assert page.has_content? "Your Dashboard"
  end
end
