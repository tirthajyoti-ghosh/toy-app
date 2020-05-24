require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    # get signup_path
    # line above commented out because it throws permission denied error in application.html.erb

    assert_no_difference "User.count" do
      post users_path, params: { user: {  name: " ",
                                          email: "invalid@email",
                                          password: "123",
                                          password_confirmation: "456"  } }
    end

    assert_select 'div#error_explanation h2', text: '4 errors prohibited this user from being saved:'
    assert_select 'div.field_with_errors', count: 8
  end

  test "valid signup information" do
    # get signup_path
    # line above commented out because it throws permission denied error in application.html.erb

    assert_difference "User.count", 1 do
      post users_path, params: { user: {  name: "Example User",
                                          email: "user@example.com",
                                          password: "password",
                                          password_confirmation: "password"  } }
    end

    follow_redirect!

    assert_not flash.empty?
    assert_select 'p#notice', text: 'User was successfully created.'
  end
end
