class Doctor < ApplicationRecord
  validates :name, presence: true
  validates :specialization, presence: true
  validates :experience, presence: true, numericality: { only_integer: true }
  validates :price, presence: true, numericality: {only_float: true}


  has_many :appointments, dependent: :destroy
  has_many :users, through: :appointments
end
