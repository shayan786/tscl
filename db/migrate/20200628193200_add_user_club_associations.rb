class AddUserClubAssociations < ActiveRecord::Migration[5.2]
  def change
    create_table :user_club_associations do |t|
      t.belongs_to :user
      t.belongs_to :club
      t.timestamps
    end
  end
end
