class AddMapToClubs < ActiveRecord::Migration[5.2]
  def change
    add_column :clubs, :map, :string
  end
end
