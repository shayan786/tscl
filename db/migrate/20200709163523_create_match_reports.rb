class CreateMatchReports < ActiveRecord::Migration[5.2]
  def change
    create_table :match_reports do |t|
      t.string :start_time
      t.string :match_result
      t.string :payment
      t.string :thirty_circle
      t.string :boundary
      t.string :scorecard
      t.string :water
      t.string :pitch
      t.string :condition
      t.string :wide
      t.string :behavior
      t.string :comments

      t.timestamps
    end
  end
end
