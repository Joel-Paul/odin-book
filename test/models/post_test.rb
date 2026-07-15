require "test_helper"

class PostTest < ActiveSupport::TestCase
  test "should not validate empty post" do
    post = Post.new
    assert_not post.valid?
  end

  test "should not validate post with no content" do
    post = Post.new(author: User.first)
    assert_not post.valid?
  end

  test "should not validate post with empty content" do
    post = Post.new(author: User.first, content: "")
    assert_not post.valid?
  end

  test "should validate post with relevant fields" do
    post = Post.new(author: User.first, content: "Hello!")
    assert post.valid?
  end

  test "should be able to get author from post" do
    foo = User.find_by(username: "Foo")
    post = Post.find_by(author: foo)
    assert_equal post.author, foo
  end

  test "should be able to get content from post" do
    foo = User.find_by(username: "Foo")
    post = Post.find_by(author: foo)
    assert_equal post.content, "Hi I'm Foo!"
  end

  test "should be able to get post from user" do
    foo = User.find_by(username: "Foo")
    post = foo.posts.first
    assert_equal post.content, "Hi I'm Foo!"
  end
end
