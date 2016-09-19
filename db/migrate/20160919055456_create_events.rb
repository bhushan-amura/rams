class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events do |t|
      t.string :type
      t.date :date
      t.string :time
      t.string :organiser

      t.timestamps null: false
    end
  end
  def down
    drop_table :events
  end
end
