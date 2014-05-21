class PagesController < ApplicationController
    before_action :set_mail_subscriber, only: [:create ]
  def home
  end
     
  def about_us
  end

  def faq
  end

  def contact
  end

end
