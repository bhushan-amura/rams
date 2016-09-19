class CreateJobOpenings < ActiveRecord::Migration
  def up
    create_table :job_openings do |t|
      t.string :title,                  null:false
      t.string :type_of_job,            null:false 
      t.string :description,            null:false
      t.integer :number_of_positions,   null:false
      t.boolean :status
      t.string :CTC

      t.timestamps null: false
    end
  end
  def down
    drop_table :job_openings
  end
end
