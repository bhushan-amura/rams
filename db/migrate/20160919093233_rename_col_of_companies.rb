class RenameColOfCompanies < ActiveRecord::Migration
  def change
    rename_column :job_openings, :type_of_job, :shift
  end
end
