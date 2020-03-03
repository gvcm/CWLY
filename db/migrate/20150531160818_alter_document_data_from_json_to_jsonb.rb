class AlterDocumentDataFromJsonToJsonb < ActiveRecord::Migration
  def change
    # http://stackoverflow.com/questions/28075479/upgrade-postgresql-json-column-to-jsonb
    execute "ALTER TABLE documents ALTER COLUMN data TYPE jsonb USING data::text::jsonb"
  end
end
