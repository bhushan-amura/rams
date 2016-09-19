class AddForeignKeyConstraintOnProjects < ActiveRecord::Migration
  def up
 	remove_column :projects, :candidate_id, :integer, index: true, foreign_key: true
  	add_column :projects, :candidate_id, :integer, index: true, foreign_key: true
  end
  def down
  	remove_column :projects, :candidate_id, :integer, index: true, foreign_key: true
  	add_column :projects, :candidate_id, :integer, index: true, foreign_key: true
  end
end
