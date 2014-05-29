class AddShipmentTypeAndPriceToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :shipping_price, :float
    add_column :orders, :grand_total, :float
    add_column :orders, :shipping_type, :string
  end
end
