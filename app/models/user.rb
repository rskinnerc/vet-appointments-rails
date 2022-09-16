# frozen_string_literal: true

class User < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments
end
