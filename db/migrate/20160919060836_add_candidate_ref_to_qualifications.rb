class AddCandidateRefToQualifications < ActiveRecord::Migration
  def change
    add_reference :qualifications, :candidate, index: true, foreign_key: true
  end
end
