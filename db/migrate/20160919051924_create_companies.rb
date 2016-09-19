class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name
      t.string :type
      t.string :url
      t.string :tagline
      t.string :email
      t.string :phone
      t.integer :number_of_employees
      t.string :description
      t.string :logo

      t.timestamps null: false
    end
  end
  def down
    drop_table :companies
  end
end
