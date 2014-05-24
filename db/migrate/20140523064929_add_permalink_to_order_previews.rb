class AddPermalinkToOrderPreviews < ActiveRecord::Migration
  def change
    add_column :order_previews, :permalink, :string
  end
end
