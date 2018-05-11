class Category < ApplicationRecord
  validates :name, presence: true, format: { with: /\A[A-Z][a-z]+\.+\s[a-zA-Z]{2,}/, message: "please enter keywords in correct format"}

  has_many :posts
  has_many :comments, as: :commentable
end
