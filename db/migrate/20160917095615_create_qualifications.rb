class CreateQualifications < ActiveRecord::Migration
  def up
    create_table :qualifications do |t|
      t.references :candidate
      t.string :course, :comment => "UG PG PHD", :null => false
      t.string :domain, :comment => "IT / COMP / MECHANICAL", :null => false
      t.timestamps null: false
    end
  end

  def down
  	drop_table :qualifications
  end
end
