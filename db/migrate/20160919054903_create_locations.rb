class CreateLocations < ActiveRecord::Migration
  def up
    create_table :locations do |t|
      t.string :city
      t.string :street_name
      t.string :street_address
      t.string :building_name
      t.string :building_number
      t.string :zipcode
      t.string :state
      t.string :country
      t.string :latitude
      t.string :longitude

      t.timestamps null: false
    end
  end
  def down
    drop_table :locations
  end
end
