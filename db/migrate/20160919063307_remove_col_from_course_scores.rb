class RemoveColFromCourseScores < ActiveRecord::Migration
  def change
    remove_foreign_key :course_scores, column: :candidate_id
    remove_column :course_scores, :candidate_id 
    remove_column :course_scores, :qualification_id
  end
end
