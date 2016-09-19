class RemoveCompanyRefFromLocations < ActiveRecord::Migration
  def change
    remove_foreign_key :locations,column: :company_id
    remove_column :locations, :company_id
  end
end
