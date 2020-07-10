class AddClubToPoints < ActiveRecord::Migration[5.2]
  def change
  	add_reference :points, :club, index: true
  end
end
