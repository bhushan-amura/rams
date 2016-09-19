class AddCandidateRefToCourseScores < ActiveRecord::Migration
  def change
    add_reference :course_scores, :candidate, index: true, foreign_key: true
  end
end
