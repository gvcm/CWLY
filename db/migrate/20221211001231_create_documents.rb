class CreateDocuments < ActiveRecord::Migration[7.0]
  def change
    create_table :documents do |t|
      t.string :url
      t.string :slug
      t.jsonb :data

      t.timestamps
    end
    add_index :documents, :slug
  end
end
