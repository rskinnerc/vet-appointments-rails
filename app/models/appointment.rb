class Appointment < ApplicationRecord
  validates :date, presence: true
  validates :user_id, presence: true
  validates :doctor_id, presence: true
  validates :city, presence: true

  belongs_to :user
  belongs_to :doctor
end
