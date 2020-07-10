class CreatePoints < ActiveRecord::Migration[5.2]
  def change
    create_table :points do |t|
      t.integer :wins
      t.integer :loses
      t.integer :tied
      t.integer :bbowl
      t.integer :bbat
      t.integer :ue
      t.integer :nur
      t.integer :ss
      t.integer :lzero
      t.integer :jc
      t.integer :nu
      t.integer :gc
      t.integer :palm

      t.timestamps
    end
  end
end
