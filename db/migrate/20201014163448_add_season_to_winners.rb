class AddSeasonToWinners < ActiveRecord::Migration[5.2]
  def change
  	add_reference :winners, :season, index: true
  end
end
