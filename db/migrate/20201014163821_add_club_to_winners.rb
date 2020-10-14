class AddClubToWinners < ActiveRecord::Migration[5.2]
  def change
  	add_column :winners, :club_id, :integer
  end
end
