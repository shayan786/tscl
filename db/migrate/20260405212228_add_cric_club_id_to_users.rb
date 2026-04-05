class AddCricClubIdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :cric_club_id, :integer
  end
end
