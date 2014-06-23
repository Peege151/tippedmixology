class AddTotalWeightToCarts < ActiveRecord::Migration
  def change
    add_column :carts, :total_weight, :float
  end
end
