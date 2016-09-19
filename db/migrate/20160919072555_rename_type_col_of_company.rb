class RenameTypeColOfCompany < ActiveRecord::Migration
  def up
    rename_column :companies, :type, :company_type
  end
  def down
    rename_column :companies, :company_type, :type
  end
end
