module OrderPreviewsHelper
 # 	def ship_options
 # 		ship_options = {}
	#         @order_preview.fedex_rates.each do |k, v|
	#             if k.service_name == "FedEx Ground Home Delivery" || k.service_name == "FedEx 2 Day" || k.service_name == "FedEx Standard Overnight"
	# 				ship_options["#{k.service_name}"] = "#{number_to_currency(k.price.to_f / 100)}"
	# 			end
	#         end
	#         @order_preview.usps_rates.each do |k, v|
	#             if k.service_name == "USPS Priority Mail 1-Day"
	# 				ship_options["#{k.service_name}"] = "#{number_to_currency(k.price.to_f / 100)}"
	#             end
	#         end
	# 		@order_preview.ship_option_hash = ship_options.map { |k,v| ["#{k} - #{v}","#{k} - #{v}" ] }
	# 		@order_preview.save
	# 		@order_preview.ship_option_hash
	# end    
end
