class CreateJudiciaryCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :judiciary_committees do |t|
      t.string :year
      t.integer :user_id

      t.timestamps
    end
  end
end
