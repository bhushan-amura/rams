class RemoveColFromQualifications < ActiveRecord::Migration
  def change
    remove_column :qualifications,:candidate_id
  end
end
