class ApplicationController < ActionController::Base
  before_filter :set_mail
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
      def set_mail
          @mail_subscriber = MailSubscriber.new(mail_subscriber_params)
      end
  private

    def current_cart 
      cart = Cart.find(session[:cart_id])
      unless cart.active?
        cart = Cart.create
        session[:cart_id] = cart.id
      end
      cart
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
    def mail_subscriber_params
      params.fetch(:mail_subscriber, {}).permit(:email, :name)
    end 
end
