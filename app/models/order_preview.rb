class OrderPreview < ActiveRecord::Base
	#dependencies
	include ActiveMerchant::Shipping
	include ActionView::Helpers::NumberHelper
	#active record associations
	belongs_to :cart
	# validations
	validates :cart_id, presence:true
	validates :name, presence: true
  	validates :city, presence: true
  	validates :state, presence: true
  	validates :zip, presence: true
  	validates :country, presence: true
  	validates :length, presence: true
  	validates :width, presence: true
  	validates :height, presence: true
  	validates :weight, presence: true
  	serialize :ship_option_hash, JSON
  	#methods

  	
  	def to_param
    	"#{id}#{permalink}"
  	end
	def origin
	    Location.new(address: "1 northside Piers", state: "NY", city: "Brooklyn", zip: "11249", country: "US")
	end

	def destination
	    Location.new(country: country, address: address, address2: address2, state: state, city: city, zip: zip, country: country)
	end

	def packages
	    package = Package.new(weight, [length, width, height], cylinder: cylinder, :units => :imperial )
	end

	def get_rates_from_shipper(shipper)
	    response = shipper.find_rates(origin, destination, packages)
	    response.rates.sort_by(&:price)
	end

	def ups_rates
	    ups = UPS.new(login: 'Peege151', password: '1Cartography', key: '3CD30753A547F326')
	    get_rates_from_shipper(ups)
	end
	#fedex key
	#wx1qgLtmgAHXWjST
	def fedex_rates
	    fedex = FedEx.new(login: "118636975", password: "8jxnO3KQMwoAGER6OY7EC3HW9", key: "wx1qgLtmgAHXWjST", account: "510087380", test: true )
	    get_rates_from_shipper(fedex)
	end
# gatewaybeta.com
# wsbeta.fedex.com

	def usps_rates
	    usps = USPS.new(login: '712TIPPE4855', password: '873SM63PI387')
		# response_first_class = usps.find_rates(origin, destination, packages, {service: :first_class})
	    get_rates_from_shipper(usps)
	end
	def change_shipping_type
			self.sub_total = cart.sub_total
           	self.shipping_price = self.shipping_type.split(/\$(.*)\z/)[1]
           	self.grand_total = self.shipping_price + cart.sub_total
			self.save
	end
	def get_ship_options
		    # binding.pry
 		ship_options = {}
	        fedex_rates.each do |k, v|
	            if k.service_name == "FedEx Ground Home Delivery" || k.service_name == "FedEx Standard Overnight"
					ship_options["#{k.service_name}"] = "#{number_to_currency(k.price.to_f / 100)}"
				end
	        end
	        usps_rates.each do |k, v|
	            if k.service_name == "USPS Priority Mail 1-Day"
					ship_options["#{k.service_name}"] = "#{number_to_currency(k.price.to_f / 100)}"
	            end
	        end
			self.ship_option_hash = ship_options.map { |k,v| ["#{k} - #{v}","#{k} - #{v}" ] }
 			self.sub_total = nil
            self.shipping_price = nil
            self.grand_total = nil
			self.save
	end
	def zip_different?
		self.zip_changed?
	end

	private
end
