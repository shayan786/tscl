class AddOverformatToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :over_format, :string
  end
end
