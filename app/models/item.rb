class Item < ApplicationRecord
	has_many :requests, dependent: :destroy
	belongs_to :category
	validates  :title, :description, presence: true

	def self.search(search)
		Item.where("title LIKE ?  AND available LIKE ?", "%#{search}%", true).or(Item.where("description LIKE ?  AND available LIKE ?", "%#{search}%", true))
		
	end
end
