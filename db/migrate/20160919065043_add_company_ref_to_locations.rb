class AddCompanyRefToLocations < ActiveRecord::Migration
  def change
    add_reference :locations, :company, index: true, foreign_key: true
  end
end
