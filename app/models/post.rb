class Post < ApplicationRecord
	mount_uploader :image, ImageUploader
	validates :name, presence: true, format: { with: /\A[A-Z][a-z]+\.+\s[a-zA-Z]{2,}/, message: "please enter keywords in correct format"}
	validates :name, :content, presence: true
	belongs_to :user
	belongs_to :category, optional: true
	has_many :comments, as: :commentable
end
