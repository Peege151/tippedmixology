class Cart < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  has_one :order_preview, dependent: :destroy
  has_one :order
    def sub_total
      self.line_items.to_a.sum { |item| item.total_price }
    end

    def width
      if self.total_units == 1.0
        return 6.0
      elsif self.total_units <= 3.0
        return 6.0
      elsif self.total_units <= 6.0
        return 12.0 
      elsif self.total_units <= 12.0
        return 12.0
      else
        return 12.0
      end
    end

    def length
      if self.total_units == 1.0
        return 6.0
      elsif self.total_units <= 3.0
        return 18.0
      elsif self.total_units <= 6.0
        return 18.0 
      elsif self.total_units <= 12.0
        return 18.0
      else
        return 24.0
      end
    end

    def height
      if self.total_units == 1.0
        return 6.0
      elsif self.total_units <= 3.0
        return 6.0
      elsif self.total_units <= 6.0
        return 6.0 
      elsif self.total_units <= 12.0
        return 12.0
      else
        return 24.0
      end
    end
end
