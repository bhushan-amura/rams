class CreateJobOpenings < ActiveRecord::Migration
  def up
    create_table :job_openings do |t|
      t.string :title
      t.string :type_of_job
      t.string :description
      t.integer :number_of_positions
      t.boolean :status
      t.string :CTC

      t.timestamps null: false
    end
  end
  def down
    drop_table :job_openings
  end
end
