class ChangeCandidateColOfProject < ActiveRecord::Migration
  def change
  	change_column :projects, :candidates_id, :integer, index: true, foreign_key: true
  end
end
