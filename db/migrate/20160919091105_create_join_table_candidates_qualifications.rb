class CreateJoinTableCandidatesQualifications < ActiveRecord::Migration
  def change
    create_join_table :candidates,:qualifications do |t|
      t.index :candidate_id
      t.index :qualification_id
    end
  end
end
