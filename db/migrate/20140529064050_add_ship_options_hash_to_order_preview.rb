class AddShipOptionsHashToOrderPreview < ActiveRecord::Migration
  def change
    add_column :order_previews, :ship_option_hash, :text
  end
end
