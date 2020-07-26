class CreateExecutiveCommittees < ActiveRecord::Migration[5.2]
  def change
    create_table :executive_committees do |t|

      t.timestamps
    end

    add_column :executive_committees, :user_id, :integer
    add_column :executive_committees, :role, :string
    add_reference :executive_committees, :season, index: true
  end
end
