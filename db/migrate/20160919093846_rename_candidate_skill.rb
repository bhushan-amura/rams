class RenameCandidateSkill < ActiveRecord::Migration
  def change
  	rename_table :candidate_skills, :candidates_skills
  end
end
