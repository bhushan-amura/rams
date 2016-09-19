class RemoveColFromQualifications2 < ActiveRecord::Migration
  def change
    remove_foreign_key :qualifications, column: :candidate_id
    remove_column :qualifications, :candidate_id
  end
end
