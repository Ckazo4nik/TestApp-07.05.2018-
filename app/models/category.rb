class Category < ApplicationRecord
  validates :name, presence: true

  has_many :posts
  has_many :comments, as: :commentable
end
