class AddStatusTocart < ActiveRecord::Migration
  def change
  	add_column :carts, :status, :boolean, default: true
  end
end
