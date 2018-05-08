class AddIndexToDocument < ActiveRecord::Migration
  def change
    add_index :documents, :slug
  end
end
