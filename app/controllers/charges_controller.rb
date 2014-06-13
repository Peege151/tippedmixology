class ChargesController < ApplicationController
  def new
    @cart = current_cart
    @order_preview = @cart.order_preview
    @amount = @order_preview.grand_total
  end
  def show
  end
  def create
    # Amount in cents
    @cart = current_cart
    @order_preview = @cart.order_preview
    @amount = @order_preview.grand_total

    customer = Stripe::Customer.create(
      :email => 'example@stripe.com',
      :card  => params[:stripeToken]
    )

    charge = Stripe::Charge.create(
      :customer    => customer.id,
      :amount      => (@amount * 100).to_i,
      :description => 'Rails Stripe customer',
      :currency    => 'usd'
    )
    @order = Order.new(
                :name => @order_preview.name,
                :email => @order_preview.email,
                :address => @order_preview.address,
                :address2 => @order_preview.address2,
                :city => @order_preview.city,
                :state => @order_preview.state,
                :zip => @order_preview.zip,
                :country => @order_preview.country,
                :permalink => @order_preview.permalink,
                :shipping_type => @order_preview.shipping_type,
                :shipping_price => @order_preview.shipping_price,
                :grand_total => @amount,
                :cart => @cart,
                :items => @cart.line_items.to_a
                )
    @order.save
    ##MAIL STUFF
    OrderMailer.new_order(@order)
    OrderMailer.confirmation(@order)
    ##redirect_conf page
    @cart.destroy
    redirect_to order_path(@order.id)

  rescue Stripe::CardError => e
    flash[:error] = e.message
    redirect_to charges_path
  end
end
