class LineItem < ActiveRecord::Base
  belongs_to :product
  belongs_to :cart
  after_create :set_order_preview_weight,  :set_package_dimentions
  after_update :set_order_preview_total_units, :set_order_preview_weight, :set_package_dimentions
  	#max capactiy here
  	def over_order_cap?
  		if self.quantity > 5
  			return true
  		end
  	end
    def set_cart_weight
      self.cart.total_weight = self.cart.line_items.sum { |item| (item.product.weight * item.quantity) + (0.2 * (item.product.weight * item.quantity))} 
      self.cart.save
    end

    def set_cart_units
      self.cart.total_units = self.cart.line_items.sum { |item| (item.product.units * item.quantity) }
      self.cart.save
    end

    def set_package_dimentions
      if self.cart.order_preview.nil?
            # ^^ if order_preview exists, set box dimentions based on box weight
      elsif self.cart.order_preview.weight == 1.0 #if one pound...(1 item)
            #then use the box that's 6x6x6
            self.cart.order_preview.width = 6.0
            self.cart.order_preview.height = 6.0
            self.cart.order_preview.length = 6.0
            self.cart.order_preview.save
            
      elsif self.cart.order_preview.weight <= 3.0 #less or = than 3, (2-3 items)
            #then use the box that's 18x6x6
            self.cart.order_preview.width = 6.0
            self.cart.order_preview.height = 6.0
            self.cart.order_preview.length = 18.0
            self.cart.order_preview.save
      
      elsif self.cart.order_preview.weight <= 6.0 #less or = than 6, (4-6 items)
            #not sure which box lets say 12x18x6
            self.cart.order_preview.width = 6.0
            self.cart.order_preview.height = 12.0
            self.cart.order_preview.length = 18.0
            self.cart.order_preview.save
      else
            #big-ass box (not sure, 24x24x12)
            self.cart.order_preview.width = 12.0
            self.cart.order_preview.height = 24.0
            self.cart.order_preview.length = 24.0
            self.cart.order_preview.save    
      end
        self.cart.order_preview.get_ship_options if self.cart.order_preview.present?
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
      end
    end
    def set_order_preview_total_units
      if 
        self.cart.order_preview.nil?
      else 
        self.set_cart_units
        self.cart.order_preview.total_units = self.cart.total_units
        self.cart.order_preview.save
      end
    end
 	def total_price
    	product.price * quantity
 	end

 	
end
