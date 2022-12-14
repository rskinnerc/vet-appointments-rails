class Doctor < ApplicationRecord
  has_one_attached :photo
  validates :name, presence: true
  validates :specialization, presence: true
  validates :experience, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: { only_float: true }
  validates :description, presence: true
  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
end
