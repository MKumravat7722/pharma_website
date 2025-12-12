class CreatePageSections < ActiveRecord::Migration[8.0]
  def change
    create_table :page_sections do |t|
      t.references :page, null: false, foreign_key: true
      t.integer :position
      t.string :section_type
      t.jsonb :content

      t.timestamps
    end
  end
end
