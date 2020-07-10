class CreateUmpireEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :umpire_evaluations do |t|
      t.string :start_time
      t.string :nu_match_result
      t.string :nu_lbw
      t.string :nu_caught
      t.string :nu_run_out
      t.string :nu_no_balls
      t.string :nu_consistency
      t.string :nu_laws
      t.string :nu_signal
      t.string :nu_pressure
      t.string :nu_overall
      t.string :nu_attire
      t.string :nu_comm_partner
      t.string :nu_comm_captain
      t.string :lu_stump
      t.string :lu_run_out
      t.string :lu_no_balls
      t.string :lu_consistency
      t.string :lu_laws
      t.string :lu_signal
      t.string :lu_overall
      t.string :lu_comm_nu
      t.string :lu_fair
      t.string :comments

      t.timestamps
    end
  end
end
