class SubscriberMailer < ActionMailer::Base
  default from: "newsletter@tippedmixology.com"
  def new_subscriber(subscriber)
  		@mail_subscriber = subscriber
  	    mail(to: "#{@mail_subscriber.email}", subject: "Thank You #{@mail_subscriber.name}")
  end
end
