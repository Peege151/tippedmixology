class OrderMailer < ActionMailer::Base
  default from: "sales@tippedmixology.com"

  def new_order
  		@order = Order.find(params[:id])
  	    mail(to: 'sales@tippedmixology.com', subject: "New Order #{order.id}")
  end

  def confirmation
  		@order = Order.find(params[:id])
  		mail(to: @order.email, subject: "Order Confirmation: #{order.id}")
  end
end
