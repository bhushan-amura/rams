class AddCandidateRefToSkills < ActiveRecord::Migration
  def change
    add_reference :skills, :candidate, index: true, foreign_key: true
  end
end
