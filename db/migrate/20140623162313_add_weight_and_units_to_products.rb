class AddWeightAndUnitsToProducts < ActiveRecord::Migration
  def change
    add_column :products, :weight, :float
    add_column :products, :units, :float
  end
end
