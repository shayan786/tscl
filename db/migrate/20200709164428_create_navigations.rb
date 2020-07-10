class CreateNavigations < ActiveRecord::Migration[5.2]
  def change
    create_table :navigations do |t|

      t.timestamps
    end
  end
end
