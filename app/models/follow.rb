class Follow < ApplicationRecord
  validates :follower, :following, presence: true
  validates :follower, uniqueness: { scope: :following }
  validates :follower, comparison: { other_than: :following, message: "%{value} cannot follow themself" }

  belongs_to :follower, class_name: "User"
  belongs_to :following, class_name: "User"
end
