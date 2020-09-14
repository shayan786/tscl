class RemoveOverFormatFromGames < ActiveRecord::Migration[5.2]
  def change
  	remove_column :games, :over_format
  end
end
