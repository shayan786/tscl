class AddPositionToUserClubAssociations < ActiveRecord::Migration[5.2]
  def change
    add_column :user_club_associations, :position, :integer
  end
end
