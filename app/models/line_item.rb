class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  after_create :set_order_preview_weight
  after_update :set_order_preview_weight
  	#max capactiy here
  	def over_order_cap?
  		if self.quantity > 5
  			return true
  		end
  	end
    def set_cart_weight
      self.cart.total_weight = self.cart.line_items.sum { |item| item.product.weight * item.quantity}
      self.cart.save
    end
    #if the cart is changed after the fedex is called, it will update and
    #the fedex api
    def set_order_preview_weight
      if 
        self.cart.order_preview.nil?
      else 
      	self.set_cart_weight
        self.cart.order_preview.weight = self.cart.total_weight
        self.cart.order_preview.save
        self.cart.order_preview.get_ship_options
      end
    end

 	def total_price
    	product.price * quantity
 	end

 	
end
