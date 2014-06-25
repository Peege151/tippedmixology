class AddunitToOrderPreview < ActiveRecord::Migration
  def change
      add_column :order_previews, :total_units, :float
  end
end
