class CreateClinicalStudies < ActiveRecord::Migration[8.0]
  def change
    create_table :clinical_studies do |t|
      t.string :title
      t.string :identifier
      t.date :published_on
      t.text :summary
      t.jsonb :meta

      t.timestamps
    end
  end
end
