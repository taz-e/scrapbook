require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @dummy_user = {
      first_name: "David",
      last_name: "Bremner",
      email: "dave@example.com",
      password: "123456",
      password_confirmation: "123456"
    }
  end

  test "should get new" do
    get :new
    assert_response :success
    assert_template 'new'
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: @dummy_user
    end
  end

  test "should fail to create user on mismatched passwords" do
    assert_no_difference('User.count') do
      post :create, :user => @dummy_user.merge({ password_confirmation: "bnewpassword" })
    end
    assert_template 'new'
  end

  test "should get edit" do
    login_as users(:paul)
    get :edit, id: users(:paul).to_param
    assert_response :success
    assert_template 'edit'
  end

  test "should update user" do
    login_as users(:michel)
    put :update, id: users(:michel).to_param, user: { first_name: "Tpsingh", last_name: "Bhullar" }
    assert_redirected_to root_path
  end

end
