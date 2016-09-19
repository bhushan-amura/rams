class CreateSkills < ActiveRecord::Migration
  def up
    create_table :skills do |t|
      t.references :candidates
      t.string :skill, :limit => 15
      t.timestamps null: false
    end
  end


  def down
  	drop_table :skills
  end
end
