class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|

      t.string :name, null: false 
      t.string :email
      t.string :contact

      t.timestamps null: false
    end
  end
end
