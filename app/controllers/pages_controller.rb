class PagesController < ApplicationController
    before_action :set_mail_subscriber, only: [:create ]
  def home
    @mail_subscriber = MailSubscriber.new(mail_subscriber_params)
  end
     
  def about_us
    @mail_subscriber = MailSubscriber.new(mail_subscriber_params)
  end

  def faq
    @mail_subscriber = MailSubscriber.new(mail_subscriber_params)
  end



  def mail_subscriber_params
    params.fetch(:mail_subscriber, {}).permit(:email, :name)
  end 
end
