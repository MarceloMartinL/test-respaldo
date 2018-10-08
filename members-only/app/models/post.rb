class Post < ApplicationRecord
	validates :title, presence: true, length: { maximum: 20 }, uniqueness: { case_sensitive: false }
	validates :body, presence: true, length: { maximum: 200 }
	validates :user_id, presence: true

	belongs_to :user
end
