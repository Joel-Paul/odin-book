class Post < ApplicationRecord
  validates :author, :content, presence: true

  belongs_to :author, class_name: "User"

  has_many :likes, dependent: :destroy
  has_many :comments, as: :commentable, dependent: :destroy
end
