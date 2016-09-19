class RemoveAndAddColSromSkills < ActiveRecord::Migration
  def change
    remove_column :skills, :candidate_id
  end
end
