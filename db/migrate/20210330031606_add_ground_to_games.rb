class AddGroundToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :ground, :string
  end
end
