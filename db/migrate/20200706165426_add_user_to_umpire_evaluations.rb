class AddUserToUmpireEvaluations < ActiveRecord::Migration[5.2]
  def change
  	add_reference :umpire_evaluations, :user, index: true
  end
end
