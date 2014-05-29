class AddShipmentTypeAndPriceToOrderPreviews < ActiveRecord::Migration
  def change
    add_column :order_previews, :shipping_price, :float
    add_column :order_previews, :shipping_type, :string
  end
end
