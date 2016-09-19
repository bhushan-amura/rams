class RemoveCandidateIdFromProjects < ActiveRecord::Migration
  def change
    remove_column :projects, :candidate_id
  end
end
