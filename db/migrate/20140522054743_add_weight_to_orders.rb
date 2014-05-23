class AddWeightToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :weight, :float
  end
end
