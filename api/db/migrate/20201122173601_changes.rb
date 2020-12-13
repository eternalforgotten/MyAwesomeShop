class Changes < ActiveRecord::Migration[5.1]
  def change
    remove_column :products, :category_id
    remove_column :users, :sex
    remove_column :users, :phone_number
    remove_column :users, :avatar
    remove_column :users, :age
    remove_column :users, :description

    add_column :products, :subname, :string, null: false
    add_column :products, :rating, :integer, null: false, default: 0
    drop_table :superusers
    drop_table :categories
  end
end
