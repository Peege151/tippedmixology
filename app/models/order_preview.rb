class OrderPreview < ActiveRecord::Base
	#dependencies
	include ActiveMerchant::Shipping
	#active record associations
	belongs_to :cart
	has_one :order
	# validations
	validates :name, presence: true
  	validates :city, presence: true
  	validates :state, presence: true
  	validates :zip, presence: true
  	validates :country, presence: true
  	validates :length, presence: true
  	validates :width, presence: true
  	validates :height, presence: true
  	validates :weight, presence: true

  	#methods
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
	    get_rates_from_shipper(usps)
	end
end
