# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

alice = User.create!(username: "Alice", email: "alice@example.com", password: "123456")
bob = User.create!(username: "Bob", email: "bob@example.com", password: "123456")
charlie = User.create!(username: "Charlie", email: "charlie@example.com", password: "123456")
diana = User.create!(username: "Diana", email: "diana@example.com", password: "123456")
etho = User.create!(username: "Etho", email: "etho@example.com", password: "123456")
fiona = User.create!(username: "Fiona", email: "fiona@example.com", password: "123456")

Follow.create!(follower: alice, following: bob)
Follow.create!(follower: alice, following: charlie)
Follow.create!(follower: alice, following: etho)
Follow.create!(follower: bob, following: alice)
Follow.create!(follower: bob, following: charlie)
Follow.create!(follower: bob, following: etho)
Follow.create!(follower: charlie, following: alice)
Follow.create!(follower: charlie, following: bob)
Follow.create!(follower: charlie, following: etho)
Follow.create!(follower: diana, following: alice)
Follow.create!(follower: diana, following: bob)
Follow.create!(follower: diana, following: charlie)
Follow.create!(follower: diana, following: etho)
Follow.create!(follower: diana, following: fiona)
Follow.create!(follower: etho, following: alice)
Follow.create!(follower: etho, following: bob)
Follow.create!(follower: etho, following: charlie)
Follow.create!(follower: etho, following: diana)
Follow.create!(follower: fiona, following: alice)
Follow.create!(follower: fiona, following: bob)
Follow.create!(follower: fiona, following: charlie)
Follow.create!(follower: fiona, following: diana)
Follow.create!(follower: fiona, following: etho)

pa = Post.create!(author: alice, content: "What a wonderful land!")
pb = Post.create!(author: bob, content: "I hope I pass the Kerman line")
pc = Post.create!(author: charlie, content: "My name is charlie the second")
pd = Post.create!(author: diana, content: "(I am actually a tree of silver)")
pe = Post.create!(author: etho, content: "Grab your snacks!")
pf = Post.create!(author: fiona, content: "its all ogre...")

Comment.create!(user: alice, commentable: pb, content: "This is a comment!")
