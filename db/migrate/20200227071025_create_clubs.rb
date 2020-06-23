class CreateClubs < ActiveRecord::Migration[5.2]
  def change
    create_table :clubs do |t|
      t.string :name
      t.string :address
      t.string :acronym
      t.string :ground

      t.timestamps
    end
  end
end
