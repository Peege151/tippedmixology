class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_one :order_preview, dependent: :destroy
  has_one :order
    def sub_total
      self.line_items.to_a.sum { |item| item.total_price }
    end


     #def archive!
      # update_attribute(:active, false)
     #end
end
