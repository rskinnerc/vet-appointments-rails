class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :specialization, presence: true
  validates :experience, presence: true

  has_many :appointments
  has_many :users, through: :appointments
end
