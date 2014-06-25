class OrderMailer < ActionMailer::Base
  default from: "sales@tippedmixology.com"

  def new_order(order)
  		@order = order
  	    mail(to: 'sales@tippedmixology.com', subject: "New Order #{order.id}")
  end

  def confirmation(order)
  		@order = order
  		attachments.inline['tippedlogo_email.png'] = File.read("app/assets/images/tippedlogo_email.png")
  		mail(to: @order.email, subject: "Order Confirmation")
  end

end
