class AddColumnToCarts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts, :value, :decimal, precision: 10, scale: 2
  end
end
