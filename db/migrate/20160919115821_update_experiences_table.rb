class UpdateExperiencesTable < ActiveRecord::Migration
  def change
  	rename_column :experiences, :employer_name, :name
  	change_column :experiences, :name, :string, :comment => "worked under employee", :limit => 20
  	add_column :experiences, :email, :string, :comment => "contact of previous employee", 
  			:limit => 100
  	rename_column :experiences, :experience_type, :shift_type 
  end
end
