class AddSeasonToPoints < ActiveRecord::Migration[5.2]
  def change
  	add_reference :points, :season, index: true
  end
end
