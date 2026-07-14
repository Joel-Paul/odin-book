class Post < ApplicationRecord
  validates :author, :content, presence: true
  belongs_to :author, class_name: "User"
end
