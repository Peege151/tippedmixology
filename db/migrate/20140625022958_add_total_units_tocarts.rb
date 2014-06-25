class AddTotalUnitsTocarts < ActiveRecord::Migration
  def change
  	    add_column :carts, :total_units, :float
  end
end
