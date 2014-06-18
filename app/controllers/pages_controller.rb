class PagesController < ApplicationController
    before_action :set_mail_subscriber, only: [:create ]
  def home
  	  @cart= current_cart
  end
     
  def about_us
  	  @cart= current_cart
  end

  def faq
  	  @cart= current_cart
  end

  def contact
  	 @cart= current_cart
  end

end
