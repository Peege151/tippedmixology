class MailSubscribersController < ApplicationController
  before_action :set_mail_subscriber, only: [:show, :edit, :update, :destroy]
  # GET /mail_subscribers
  # GET /mail_subscribers.json
  def index
    @mail_subscribers = MailSubscriber.all
  end

  # GET /mail_subscribers/1
  # GET /mail_subscribers/1.json
  def show
  end

  # GET /mail_subscribers/new
  def new
    @mail_subscriber = MailSubscriber.new
  end

  # GET /mail_subscribers/1/edit
  def edit
  end

  # POST /mail_subscribers
  # POST /mail_subscribers.json
  def create
    @mail_subscriber = MailSubscriber.new(mail_subscriber_params)

    respond_to do |format|
      if @mail_subscriber.save
         SubscriberMailer.new_subscriber(@mail_subscriber).deliver
        format.html { redirect_to root_path, notice: 'Mail subscriber was successfully created.' }
        format.json { redirect_to root_path, status: :created, location: @mail_subscriber }
      else
        flash[:error] = "You Are Already On Our Newsletter Mailing List!"
        format.html { redirect_to root_path }
        format.json { render json: @mail_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mail_subscribers/1
  # PATCH/PUT /mail_subscribers/1.json
  def update
    respond_to do |format|
      if @mail_subscriber.update(mail_subscriber_params)
        format.html { redirect_to @mail_subscriber, notice: 'Mail subscriber was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @mail_subscriber.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mail_subscribers/1
  # DELETE /mail_subscribers/1.json
  def destroy
    @mail_subscriber.destroy
    respond_to do |format|
      format.html { redirect_to mail_subscribers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mail_subscriber
      @mail_subscriber = MailSubscriber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def mail_subscriber_params
      params.require(:mail_subscriber).permit(:email, :name)
    end

end
