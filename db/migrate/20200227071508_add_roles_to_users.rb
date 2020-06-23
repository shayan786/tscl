class AddRolesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_ec, :boolean
    add_column :users, :is_captain, :boolean
  end
end
