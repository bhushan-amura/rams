class CreateLinks < ActiveRecord::Migration
  def up
    create_table :links do |t|
      t.references :candidate
      t.string :type, :comment => "linkedin / course name", :null => false, :limit => 50
      t.string :url, :comment => "digital certification link", :null => false
      t.timestamps null: false
    end
  end

  def down
  	drop_table :links
  end
end
