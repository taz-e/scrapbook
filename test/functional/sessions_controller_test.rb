require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  
  setup do
    @user = User.create(
      first_name: "David",
      last_name: "Bremner",
      email: "dave@example.com",
      password: "123456",
      password_confirmation: "123456",
      login_count: 0)
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
  end

  test "should log in user" do
    post :create, { email: 'dave@example.com', password: "123456" }
    assert_redirected_to root_path
  end

  test "should not login user with invalid username/password" do
    post :create, { email: 'tpsingh@test.com', password: "123456" }
    assert_template 'new'
  end
end
