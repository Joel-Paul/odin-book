require "test_helper"

class CommentTest < ActiveSupport::TestCase
  test "should not validate empty Comment" do
    comment = Comment.new
    assert_not comment.valid?
  end

  test "should not validate user commenting on a post without content" do
    foo = User.find_by(username: "Foo")
    post = Post.first
    comment = Comment.new(commentable: post, user: foo)
    assert_not comment.valid?
  end

  test "should validate user commenting on a post" do
    foo = User.find_by(username: "Foo")
    post = Post.first
    comment = Comment.new(commentable: post, user: foo, content: "Hello")
    assert comment.valid?
  end

  test "should validate user commenting on a comment" do
    foo = User.find_by(username: "Foo")
    parent = Comment.first
    comment = Comment.new(commentable: parent, user: foo, content: "Hello")
    assert comment.valid?
  end

  test "should find that Foo has commented on their own post" do
    foo = User.find_by(username: "Foo")
    post = Post.find_by(author: foo)
    comment = post.comments.first
    assert_equal(foo, comment.user)
  end

  test "should find that Foo has commented on Bar's post" do
    foo = User.find_by(username: "Foo")
    bar = User.find_by(username: "Bar")
    post = Post.find_by(author: bar)
    comment = post.comments.first
    assert_equal(foo, comment.user)
  end

  test "should find that Bar has commented on Foo's comment" do
    foo = User.find_by(username: "Foo")
    bar = User.find_by(username: "Bar")
    post = Post.find_by(author: foo)
    parent = post.comments.first
    comment = parent.comments.first
    assert_equal(bar, comment.user)
  end

  test "should find that Foo's post has 1 comment" do
    foo = User.find_by(username: "Foo")
    post = Post.find_by(author: foo)
    assert_equal(1, post.comments.count)
  end

  test "should find that Bar's post has 1 comment" do
    bar = User.find_by(username: "Bar")
    post = Post.find_by(author: bar)
    assert_equal(1, post.comments.count)
  end
end
