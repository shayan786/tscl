class ChangeUmpireLevelInUsers < ActiveRecord::Migration[5.2]
  def change
  	 change_column :users, :umpire_level, :string
  end
end
