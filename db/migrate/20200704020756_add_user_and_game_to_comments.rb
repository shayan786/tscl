class AddUserAndGameToComments < ActiveRecord::Migration[5.2]
  def change
  	add_reference :comments, :user, index: true
  	add_reference :comments, :game, index: true
  end
end
