class CreateProducts < ActiveRecord::Migration[8.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :slug
      t.string :brand
      t.text :short_description
      t.text :description
      t.jsonb :composition
      t.jsonb :indications
      t.jsonb :dosage
      t.references :category, null: false, foreign_key: true
      t.boolean :published

      t.timestamps
    end
    add_index :products, :slug, unique: true
  end
end
