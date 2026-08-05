require "test_helper"

class LikeTest < ActiveSupport::TestCase
  test "should not validate empty like" do
    like = Like.new
    assert_not like.valid?
  end

  test "should validate user liking a post" do
    foo = User.find_by(username: "Foo")
    bar = User.find_by(username: "Bar")
    post = Post.find_by(author: bar)
    like = Like.new(post: post, user: foo)
    assert like.valid?
  end

  test "should not validate user liking a post they have already liked" do
    foo = User.find_by(username: "Foo")
    post = Post.find_by(author: foo)
    like = Like.new(post: post, user: foo)
    assert_not like.valid?
  end

  test "should find that Foo has liked their own post" do
    foo = User.find_by(username: "Foo")
    post = Post.find_by(author: foo)
    liked_post = foo.liked_posts.first
    assert_equal(post, liked_post)
  end

  test "should find that Bar has liked Foo's post" do
    foo = User.find_by(username: "Foo")
    bar = User.find_by(username: "Bar")
    post = Post.find_by(author: foo)
    liked_post = bar.liked_posts.first
    assert_equal(post, liked_post)
  end

  test "should find that Foo's post has 2 likes" do
    foo = User.find_by(username: "Foo")
    post = Post.find_by(author: foo)
    assert_equal(2, post.likes.count)
  end

  test "should find that Bar's post has 0 likes" do
    bar = User.find_by(username: "Bar")
    post = Post.find_by(author: bar)
    assert_equal(0, post.likes.count)
  end
end
