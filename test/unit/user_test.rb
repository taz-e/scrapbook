require 'test_helper'

class UserTest < ActiveSupport::TestCase
   setup do
    @dummy_user = {
      first_name: "David",
      last_name: "Bremner",
      email: "dave@example.com",
      password: "123456",
      password_confirmation: "123456"
    }
  end

  test 'should create' do
    assert_difference 'User.count' do
      User.create @dummy_user
    end
  end

  test 'should require a password' do
    u = User.new @dummy_user.merge({password: "", password_confirmation: ""})
    assert !u.save
    assert u.errors.messages.include?(:password)
  end

  test 'should require unique email' do
    u = User.new @dummy_user.merge({email: 'hess@example.com'})
    assert !u.valid?
    assert u.errors.messages.include?(:email)
  end

  test 'should associate to albums' do
    assert users(:michel).albums.include?(albums(:marriage))
  end
end
