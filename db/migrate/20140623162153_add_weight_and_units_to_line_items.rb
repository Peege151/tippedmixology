class AddWeightAndUnitsToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :weight, :float
    add_column :line_items, :units, :float
  end
end
