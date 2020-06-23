class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.date :date
      t.integer :home_id
      t.integer :away_id
      t.integer :umpire_id

      t.timestamps
    end
  end
end
