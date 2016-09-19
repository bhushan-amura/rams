class AddCandidateRefToProjects < ActiveRecord::Migration
  def change
    add_reference :projects, :candidate, index: true, foreign_key: true
  end
end
