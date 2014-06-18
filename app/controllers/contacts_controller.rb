class ContactsController < ApplicationController
  def new
    @contact = Contact.new
    @cart= current_cart

  end

  def create
    @contact = Contact.new(params[:contact])
    @contact.request = request
    if @contact.deliver
      flash.now[:success] = 'Thank you for your message!'
      redirect_to root_path
    else
      flash.now[:error] = 'Cannot send message.'
      redirect_to new_contact_path
    end
  end
  def mail_subscriber_params
    params.fetch(:mail_subscriber, {}).permit(:email, :name)
  end 
end