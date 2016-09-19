class AddLocatableRefToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :locatable, polymorphic:true, index: true
  end
end
