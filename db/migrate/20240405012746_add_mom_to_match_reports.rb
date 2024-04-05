class AddMomToMatchReports < ActiveRecord::Migration[5.2]
  def change
    add_column :match_reports, :mom, :string
  end
end
