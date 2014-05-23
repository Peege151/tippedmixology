class AddCylToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :cylinder, :boolean
  end
end
