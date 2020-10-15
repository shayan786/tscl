class AddTsclIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :tscl_id, :integer
  end
end
