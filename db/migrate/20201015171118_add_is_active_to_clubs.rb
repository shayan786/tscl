class AddIsActiveToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :is_active, :boolean
  end
end
