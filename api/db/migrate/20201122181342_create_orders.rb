class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.belongs_to :user
      t.decimal :value, precision: 10, scale: 2
      t.timestamps
      t.string :name, default: ""
    end
  end
end
