class Item < ApplicationRecord
	has_many :requests, dependent: :destroy
	validates  :title, :description, presence: true
end
