class RemoveimageFromProducts < ActiveRecord::Migration
  def change
  	remove_column :products, :image, :text
  end
end
