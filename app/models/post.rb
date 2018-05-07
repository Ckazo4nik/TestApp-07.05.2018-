class Post < ApplicationRecord
	# validates :name, presence: true, format: { with: /[A-Z][a-z]+\.+\s[a-zA-Z]{2,}/i, message: "please enter keywords in correct format"}
	validates :name, :content, presence: true
	belongs_to :user
end
