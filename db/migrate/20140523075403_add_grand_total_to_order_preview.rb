class AddGrandTotalToOrderPreview < ActiveRecord::Migration
  def change
    add_column :order_previews, :grand_total, :float
  end
end
