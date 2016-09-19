class RemoveCandidateKeyFromSkills < ActiveRecord::Migration
  def change
  	remove_foreign_key :skills,column: :candidate_id
  	remove_column :skills, :candidate_id
  end
end
