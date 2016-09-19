class RemoveCandidateColFromLinks < ActiveRecord::Migration
  def change
    remove_column :links,:candidate_id
  end
end
