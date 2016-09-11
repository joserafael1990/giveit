class Request < ApplicationRecord
  belongs_to :item
  validates  :requester, :body, presence: true
end
