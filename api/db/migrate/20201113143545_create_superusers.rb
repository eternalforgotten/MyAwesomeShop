class CreateSuperusers < ActiveRecord::Migration[5.1]
  def change
    create_table :superusers do |t|
      t.string :login, null: false
      t.string :password_digest, null: false
      t.string :role
      t.timestamps
      t.index :login
    end
  end
end
