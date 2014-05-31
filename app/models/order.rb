class Order < ActiveRecord::Base
	#dependencies
	include ActiveMerchant::Shipping
	#active record associations
	belongs_to :cart
	# validations
	validates :name, presence: true
  	validates :city, presence: true
  	validates :state, presence: true
  	validates :zip, presence: true
  	validates :country, presence: true
  	# validates :length, presence: true
  	# validates :width, presence: true
  	# validates :height, presence: true
  	# validates :weight, presence: true

  	#methods
end
