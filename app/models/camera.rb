class Camera < ApplicationRecord
	belongs_to :user
	has_many :bookings

	validates :model, presence: true
	validates :model, length: { maximum: 100 }
	validates :price, numericality: { greater_than: 0 }
	validates :price, format: { with: /\A\d+(?:\.\d{0,2})?\z/ }
end
