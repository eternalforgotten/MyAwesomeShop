class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name, null: false
      t.string :description
      t.string :picture
      t.decimal :value, precision: 10, scale: 2
      t.belongs_to :category, class_name: "category", foreign_key: "category_id"
      t.timestamps
    end
    add_column :users, :avatar, :string
  end
end
