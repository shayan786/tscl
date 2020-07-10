class AddConfirmationsToGames < ActiveRecord::Migration[5.2]
  def change
    add_column :games, :hc, :boolean
    add_column :games, :ac, :boolean
    add_column :games, :uc, :boolean
    add_column :games, :he, :boolean
    add_column :games, :ae, :boolean
    add_column :games, :mr, :boolean
  end
end
