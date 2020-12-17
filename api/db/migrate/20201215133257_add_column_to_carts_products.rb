class AddColumnToCartsProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :carts_products, :quantity, :integer, default: 1
  end
end
