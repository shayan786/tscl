class AddMomToUmpireEvaluations < ActiveRecord::Migration[5.2]
  def change
    add_column :umpire_evaluations, :mom, :string
  end
end
