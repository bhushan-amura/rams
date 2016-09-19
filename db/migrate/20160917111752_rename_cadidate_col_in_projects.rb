class RenameCadidateColInProjects < ActiveRecord::Migration
  def change
  	rename_column :projects, :candidates_id, :candidate_id
  end
end
