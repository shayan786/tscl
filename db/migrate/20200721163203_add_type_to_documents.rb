class AddTypeToDocuments < ActiveRecord::Migration[5.2]
  def change
    add_column :documents, :type, :string
  end
end
