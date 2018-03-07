class User < ApplicationRecord

  has_secure_password
  validates :username, uniqueness: true
  has_many :reservations
  has_many :libraries, through: :reservations

  validates :username, :email, :first_name, :last_name, presence: true

end
