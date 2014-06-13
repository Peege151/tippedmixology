class RenameStatusToCart < ActiveRecord::Migration
  def change
  	    rename_column :carts, :status, :active

  end
end
