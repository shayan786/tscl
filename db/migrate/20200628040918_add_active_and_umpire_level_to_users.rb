class AddActiveAndUmpireLevelToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_active, :boolean
    add_column :users, :umpire_level, :integer
  end
end
