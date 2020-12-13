class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.boolean :sex
      t.integer :age
      t.string :description
      t.string :password_digest, null: false
      t.string :phone_number, null: false
      t.string :email
      t.timestamps
      t.index :name
      t.index :phone_number
      t.index :email
    end
  end
end
