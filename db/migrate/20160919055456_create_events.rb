class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :type,         null:false
      t.date :date,           null:false
      t.string :time,         null:false
      t.string :organiser

      t.timestamps null: false
    end
  end
  def down
    drop_table :events
  end
end
