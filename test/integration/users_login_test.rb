require 'test_helper'

class UsersLoginTest < ActionDispatch::IntegrationTest
  test "should display flash message for invalid login details" do
    get login_path
    assert_select "h1", text: "Log in"
    post login_path, params: { session: { email: "", password: "" } }
    assert_not flash.empty?
    assert_select "p#notice", text: "Invalid email/password combination"
    get root_path
    assert flash.empty?
  end
end
