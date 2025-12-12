class CreatePages < ActiveRecord::Migration[8.0]
  def change
    create_table :pages do |t|
      t.string :title
      t.string :slug
      t.string :meta_title
      t.text :meta_description
      t.jsonb :settings
      t.boolean :published

      t.timestamps
    end
    add_index :pages, :slug, unique: true
  end
end
