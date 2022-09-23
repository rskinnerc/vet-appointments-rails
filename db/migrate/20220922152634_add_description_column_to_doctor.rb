class AddDescriptionColumnToDoctor < ActiveRecord::Migration[7.0]
  def change
    add_column :doctors, :description, :text
  end
end
