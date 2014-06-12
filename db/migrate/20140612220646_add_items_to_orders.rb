class AddItemsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :items, :text, array:true
  end
end
