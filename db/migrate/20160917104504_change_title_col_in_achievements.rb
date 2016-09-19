class ChangeTitleColInAchievements < ActiveRecord::Migration
  def change
    change_column :achievements, :title, :string, null: false
  end
end
