class AddTotalToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :total_points, :float
  end
end
