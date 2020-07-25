class CreateMoms < ActiveRecord::Migration[5.2]
  def change
    create_table :moms do |t|
      t.timestamps
    end

    add_reference :moms, :user, index: true
    add_reference :moms, :game, index: true
  end
end
