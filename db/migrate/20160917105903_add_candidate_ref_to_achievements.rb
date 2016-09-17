class AddCandidateRefToAchievements < ActiveRecord::Migration
  def change
    add_reference :achievements, :candidate, index: true, foreign_key: true
  end
end
