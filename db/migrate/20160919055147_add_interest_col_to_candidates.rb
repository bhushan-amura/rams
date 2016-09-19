class AddInterestColToCandidates < ActiveRecord::Migration
  def up
  	add_column :candidates, :interests, :text
  end
  def down
  	remove_column :candidates, :interests, :text
  end
end
