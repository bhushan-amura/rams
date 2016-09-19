class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.string :city,             null:false
      t.string :street_name,      null:false
      t.string :street_address,   null:false
      t.string :building_name,    null:false
      t.string :building_number,  null:false
      t.string :zipcode,          null:false
      t.string :state,            null:false
      t.string :country,          null:false
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
  def down
    drop_table :locations
  end
end
