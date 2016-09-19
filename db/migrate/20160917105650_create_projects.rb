class CreateProjects < ActiveRecord::Migration
  def up
    create_table :projects do |t|
      t.references :candidates
      t.string :title, :null => false, :limit => 50
      t.string :domain, :limit => 50
      t.date :start_date
      t.date :end_date, :null => false
      t.string :position, :comment => "student / intern / Software-developer etc", :null => false, :limit => 35
      t.string :organisation, :comment => " college / company ", :null => false, :limit => 35
      t.text :information, :null => false
      t.timestamps null: false
    end
  end

  def down
  	drop_table :projects
  end
end
