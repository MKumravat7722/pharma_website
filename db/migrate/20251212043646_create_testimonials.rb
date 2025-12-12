class CreateTestimonials < ActiveRecord::Migration[8.0]
  def change
    create_table :testimonials do |t|
      t.string :author
      t.string :designation
      t.text :quote
      t.boolean :approved

      t.timestamps
    end
  end
end
