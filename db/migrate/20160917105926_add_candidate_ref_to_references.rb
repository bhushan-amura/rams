class AddCandidateRefToReferences < ActiveRecord::Migration
  def change
    add_reference :references, :candidate, index: true, foreign_key: true
  end
end
