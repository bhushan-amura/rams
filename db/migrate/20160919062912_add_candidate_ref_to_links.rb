class AddCandidateRefToLinks < ActiveRecord::Migration
  def change
    add_reference :links, :candidate, index: true, foreign_key: true
  end
end
