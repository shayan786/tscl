class AddUserToMatchReports < ActiveRecord::Migration[5.2]
  def change
  	add_reference :match_reports, :game, index: true
  	add_reference :match_reports, :user, index: true
  end
end
