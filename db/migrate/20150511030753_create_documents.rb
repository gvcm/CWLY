class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :url
      t.string :slug
      t.json :data

      t.timestamps null: false
    end
  end
end
