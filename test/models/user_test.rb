require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "should not validate empty user" do
    user = User.new
    assert_not user.valid?
  end

  test "should not validate user with invalid email" do
    user = User.new(username: "Test", email: "test", password: "123456")
    assert_not user.valid?
  end

  test "should not validate user with existing username" do
    user = User.new(username: "Foo", email: "test@example.com", password: "123456")
    assert_not user.valid?
  end

  test "should not validate user with existing email" do
    user = User.new(username: "Test", email: "foo@example.com", password: "123456")
    assert_not user.valid?
  end

  test "should validate user with valid info" do
    user = User.new(username: "Test", email: "test@example.com", password: "123456")
    assert user.valid?
  end
end
