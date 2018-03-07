class Reservation < ApplicationRecord
  belongs_to :library
  belongs_to :user

  validates :user_id, presence: true, numericality: { only_integer: true }
  validates :library_id, presence: true, numericality: { only_integer: true }
  validates :date, :start_time, :end_time, presence: true

  validate :validate_user_id
  validate :validate_library_id

  private

  def validate_user_id
   errors.add(:user_id, "is invalid") unless User.exists?(id: self.user_id)
  end

  def validate_library_id
   errors.add(:library_id, "is invalid") unless Library.exists?(id: self.library_id)
  end
end
