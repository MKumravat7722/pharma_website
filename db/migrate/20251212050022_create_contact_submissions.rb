class CreateContactSubmissions < ActiveRecord::Migration[8.0]
  def change
    create_table :contact_submissions do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.text :message
      t.string :submission_type
      t.jsonb :meta

      t.timestamps
    end
  end
end
