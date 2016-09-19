class AddForeignKeyProj < ActiveRecord::Migration
  def change
  	change_column :projects, :candidate_id, :integer, index: true, foreign_key: true 
  end
end
