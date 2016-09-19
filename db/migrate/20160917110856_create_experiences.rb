class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :employer_name, null: false
      t.string :start_date
      t.string :end_date
      t.text :description
      t.string :experience_type 

      t.references :candidate, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
