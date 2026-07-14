require "test_helper"

class FollowTest < ActiveSupport::TestCase
  test "should not validate empty follow" do
    follow = Follow.new
    assert_not follow.valid?
  end

  test "should not validate user following themself" do
    user = User.first
    follow = Follow.new(follower: user, following: user)
    assert_not follow.valid?
  end

  test "should validate user following another user" do
    bar = User.find_by(username: "Bar")
    foo = User.find_by(username: "Foo")
    follow = Follow.new(follower: bar, following: foo)
    assert follow.valid?
  end

  test "should not validate user following a user they are already following" do
    foo = User.find_by(username: "Foo")
    bar = User.find_by(username: "Bar")
    follow = Follow.new(follower: foo, following: bar)
    assert_not follow.valid?
  end

  test "should find that Foo is following Bar" do
    foo = User.find_by(username: "Foo")
    bar = User.find_by(username: "Bar")
    assert_equal(foo.following_users.first, bar)
  end

  test "should find that Bar is being followed by Foo" do
    bar = User.find_by(username: "Bar")
    foo = User.find_by(username: "Foo")
    assert_equal(bar.follower_users.first, foo)
  end
end
