class AddGameToUmpireEvaluations < ActiveRecord::Migration[5.2]
  def change
  	add_reference :umpire_evaluations, :game, index: true
  end
end
