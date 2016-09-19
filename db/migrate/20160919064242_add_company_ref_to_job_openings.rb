class AddCompanyRefToJobOpenings < ActiveRecord::Migration
  def change
    add_reference :job_openings, :company, index: true, foreign_key: true
  end
end
