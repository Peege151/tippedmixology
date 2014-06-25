class OrderMailer < ActionMailer::Base
  default from: "sales@tippedmixology.com"

  def new_order(order)
  		@order = order
  	    mail(to: 'sales@tippedmixology.com', subject: "New Order #{order.id}")
  end

  def confirmation(order)
  		@order = order
  		mail(to: @order.email, subject: "Order Confirmation", content_type: "text/html")
  		attachments.inline['tippedlogods.png'] = File.read(Rails.root, "app/assets/images/tippedlogods.png")

  end

end
