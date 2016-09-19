class CandidateSkill < ActiveRecord::Migration
  def change
    create_join_table :candidate,:skills do |t|
      t.index :candidate_id
      t.index :skill_id
      t.timestamps null: false
    end
  end
end
