class OrderPreviewsController < ApplicationController
  before_action :set_order_preview, only: [:show, :edit, :update, :destroy]

  # GET /order_previews
  # GET /order_previews.json
  def index
    @order_previews = OrderPreview.all
  end

  # GET /order_previews/1
  # GET /order_previews/1.json
  def show
    @cart = current_cart
    @order_preview = @cart.order_preview
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
        format.html { redirect_to @order_preview, notice: 'Order preview was successfully created.' }
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
        format.html { redirect_to @order_preview, notice: 'Order preview was successfully updated.' }
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
    def set_order_preview
        @cart = current_cart
        @order_preview = @cart.order_preview
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def order_preview_params
      params.require(:order_preview).permit(:name, :address, :address2, :city, :state, :zip, :width, :height, :length, :weight, :cylinder, :country, :cart_id, :email, :permalink)
    end
end
