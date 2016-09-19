class CreateTestScores < ActiveRecord::Migration
  def change
    create_join_table :candidates,:tests do |t|
      t.index :candidate_id
      t.index :test_id
      t.float :score
      t.timestamps null: false
    end

    rename_table :candidates_tests, :test_scores
  end
end
