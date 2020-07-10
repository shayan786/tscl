class AddFfToPoints < ActiveRecord::Migration[5.2]
  def change
    add_column :points, :ff, :integer
  end
end
