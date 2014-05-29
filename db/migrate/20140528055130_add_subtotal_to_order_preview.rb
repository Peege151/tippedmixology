class AddSubtotalToOrderPreview < ActiveRecord::Migration
  def change
    add_column :order_previews, :sub_total, :float
  end
end
