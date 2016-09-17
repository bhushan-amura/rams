class CreateCandidates < ActiveRecord::Migration
  def up
    create_table :candidates do |t|

      t.string "first_name", :null => false, :limit => 20
      t.string "last_name", :null => false, :limit => 25
      t.date   "dob", :null => false
      t.string "gender", :null => false
      t.string "email", :null => false, :limit => 100
      t.string "marital_status"
      t.boolean "status", :default => true, :comment => "A job seeker(true) or not(false)"
      t.text   "languages", :default => "English"
      t.text   "summary", :limit => 500
      
      t.timestamps null: false
    end
  end

  def down
  	  drop_table :candidates
  end
end
