class CreateCourseScores < ActiveRecord::Migration
  def up
    create_table :course_scores do |t|
      t.references :qualification
      t.string :course, :comment => "FE BE TE", :null => false
      t.date :start_year, :comment => "course start year"
      t.date :end_year, :comment => "course finish year", :null => false
      t.float :score, :null => false
      t.timestamps null: false
    end
  end

  def down
  	drop_table :course_scores
  end
end
