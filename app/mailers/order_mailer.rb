class OrderMailer < ActionMailer::Base
  default from: "sales@tippedmixology.com"

  def new_order(order)
  		@order = order
  		content_type "text/html"
  	    mail(to: 'sales@tippedmixology.com', subject: "New Order #{order.id}")
  end

  def confirmation(order)
  		@order = order
  		content_type "text/html"
  		mail(to: @order.email, subject: "Order Confirmation: #{order.id}")
  end

end
