# frozen_string_literal: true

class AddPriceToDoctors < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :price, :float
  end
end
