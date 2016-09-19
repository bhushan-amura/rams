class AddQualificationRefToCourseScores < ActiveRecord::Migration
  def change
    add_reference :course_scores, :qualification, index: true, foreign_key: true
  end
end
