class CreateCompanies < ActiveRecord::Migration
  def up
    create_table :companies do |t|
      t.string :name,                   null: false
      t.string :type,                   null: false
      t.string :url,                    null: false
      t.string :tagline 
      t.string :email,                  null: false,  default: ""
      t.string :phone,                  null: false
      t.integer :number_of_employees
      t.string :description,            null: false
      t.string :logo

      t.timestamps null: false
    end
  end
  def down
    drop_table :companies
  end
end
