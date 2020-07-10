class ChangeSchedulesToGames < ActiveRecord::Migration[5.2]
  def change
  	rename_table :schedules, :games
  end
end
