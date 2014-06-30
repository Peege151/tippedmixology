class PagesController < ApplicationController
    before_action :set_mail_subscriber, only: [:create ]
  def home
  	  @cart= current_cart
      @title= "Welcome"
  end
     
  def about_us
  	  @cart= current_cart
            @title= "About Us"

  end

  def faq
  	  @cart= current_cart
            @title= "FAQ Section"

  end

  def contact
  	 @cart= current_cart
     @title="Contact"
  end

end
