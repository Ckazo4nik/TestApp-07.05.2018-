require 'rails_helper'

RSpec.describe Post, type: :model do
	it { should validate_presence_of :name }
	it { should validate_presence_of :content }
	it { should belong_to :user }
	it { should belong_to :category }
end
