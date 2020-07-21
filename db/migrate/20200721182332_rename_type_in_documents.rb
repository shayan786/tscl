class RenameTypeInDocuments < ActiveRecord::Migration[5.2]
  def change
  	rename_column :documents, :type, :doc_type
  end
end
