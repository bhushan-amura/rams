class RenameTableJobOpeningToJobOppurtunityAndChangeColumnName < ActiveRecord::Migration
  def up
    rename_column :job_openings, :shift, :shift_type
    rename_table :job_openings, :job_oppurtunity
  end
  def down
    rename_table :job_oppurtunity, :job_openings
    rename_column :job_openings, :shift_type, :shift
  end
end
