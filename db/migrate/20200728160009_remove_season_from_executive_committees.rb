class RemoveSeasonFromExecutiveCommittees < ActiveRecord::Migration[5.2]
  def change
  	remove_column :executive_committees, :season_id
  	add_column :executive_committees, :year, :string
  end
end
