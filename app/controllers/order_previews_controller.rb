class OrderPreviewsController < ApplicationController
  before_action :set_order_preview, only: [:show, :edit, :update, :destroy]
   

  # GET /order_previews
  # GET /order_previews.json
  include ActiveMerchant::Shipping
  include ActionView::Helpers::NumberHelper


  def index
    @order_previews = OrderPreview.all
  end

  # GET /order_previews/1
  # GET /order_previews/1.json
  def show
    @cart = current_cart
    @order_preview = @cart.order_preview
    @amount = @order_preview.grand_total
  end

  # GET /order_previews/new
  def new
    @cart = current_cart
    @order_preview = OrderPreview.new
  end

  # GET /order_previews/1/edit
  def edit
    @cart = current_cart
  end

  # POST /order_previews
  # POST /order_previews.json
  def create
    @cart = current_cart
    if  @cart.order_preview == nil
        @order_preview = @cart.build_order_preview(order_preview_params)
    else
        @order_preview = @cart.order_preview
        render action: 'show'
        return @order_preview
    end
    respond_to do |format|
      if @order_preview.save
          get_ship_options
        format.html { redirect_to @order_preview }
        format.json { render action: 'show', status: :created, location: @order_preview }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_preview.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_previews/1
  # PATCH/PUT /order_previews/1.json
  def update
    
    respond_to do |format|
      if @order_preview.update(order_preview_params) 
          if params['order_preview']['shipping_type'].present?
             @order_preview.change_shipping_type 
             flash[:success] =  "Added: '#{@order_preview.shipping_type}'"
          else
          get_ship_options
              flash[:success] =  "Address Updated"

      end
        format.html { redirect_to @order_preview }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order_preview.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_previews/1
  # DELETE /order_previews/1.json
  def destroy
    @order_preview.destroy
    respond_to do |format|
      format.html { redirect_to order_previews_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def get_ship_options
      @order_preview.get_ship_options
  end
  def set_order_preview
        @cart = current_cart
        @order_preview = @cart.order_preview
  end
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_preview_params
      params.fetch(:order_preview, {}).permit(:name, :address, :address2, :city, :state, :zip, :width, :height, :length, :weight, :cylinder, :country, :cart_id, :email, :permalink, :shipping_type, :shipping_price, :sub_total, :grand_total, :ship_option_hash)
    end
    def update_ship_options
      if @order_preview.zip_changed?
          get_ship_options
      end
    end
end
