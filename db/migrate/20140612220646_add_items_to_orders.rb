class AddItemsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :items, :integer, array:true
  end
end
