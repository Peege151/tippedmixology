class AddPermalinkTocart < ActiveRecord::Migration
  def change
  	  	add_column :carts, :permalink, :string, default: true
  end
end
