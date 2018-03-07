class Library < ApplicationRecord
  has_many :reservations

  validates :name, :address, :description, presence: true
  validates :room_number, inclusion: 0..1000
end
