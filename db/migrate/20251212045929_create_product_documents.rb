class CreateProductDocuments < ActiveRecord::Migration[8.0]
  def change
    create_table :product_documents do |t|
      t.references :product, null: false, foreign_key: true
      t.string :title
      t.string :document_type
      t.jsonb :metadata

      t.timestamps
    end
  end
end
