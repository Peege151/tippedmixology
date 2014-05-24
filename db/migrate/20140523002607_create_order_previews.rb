class CreateOrderPreviews < ActiveRecord::Migration
  def change
    create_table :order_previews do |t|
      t.string :name
      t.string :address
      t.string :address2
      t.string :city
      t.string :state
      t.string :zip
      t.float :width
      t.float :height
      t.float :length
      t.float :weight
      t.boolean :cylinder
      t.string :country
      t.integer :cart_id
      t.string :email

      t.timestamps
    end
  end
end
