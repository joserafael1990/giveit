class Item < ApplicationRecord
	has_many :requests, dependent: :destroy
	belongs_to :category
	validates  :title, :description, presence: true
end
