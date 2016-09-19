class UpdateAchievementsTable < ActiveRecord::Migration
  def change
  	change_column :achievements, :description, :text
  end
end
