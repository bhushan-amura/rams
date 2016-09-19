class RenameCandidateColInSkills < ActiveRecord::Migration
  def change
  	rename_column :skills, :candidates_id, :candidate_id
  end
end
