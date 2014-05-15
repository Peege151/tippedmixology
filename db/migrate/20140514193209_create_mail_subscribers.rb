class CreateMailSubscribers < ActiveRecord::Migration
  def change
    create_table :mail_subscribers do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
