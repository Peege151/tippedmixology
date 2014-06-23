class CartsController < ApplicationController
  before_action :set_cart, only: [:show, :edit, :update]
  after_action :set_cart_weight, only: [:update, :create]

  # GET /carts
  # GET /carts.json
  def index
    @carts = Cart.all
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
   #   if Cart.find_by_id(session[:cart_id]).active? ==false
   #      @cart = Cart.create
   #      session[:cart_id] = @cart
   #      @cart
   #      redirect_to @cart
   # else
      @cart = current_cart
   # end
  end

  # GET /carts/new
  def new
      @cart = Cart.create
      session[:cart_id] = @cart.id
      @cart
      redirect_to @cart
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(cart_params)
    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render action: 'show', status: :created, location: @cart }
      else
        format.html { render action: 'new' }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /carts/1
  # PATCH/PUT /carts/1.json
  def update
      if @cart.update(cart_params)
         redirect_to @cart, notice: 'Cart was successfully updated.' 
      else
        redirect_to @cart, notice: "Failed to Update"
      end
  end
  # DELETE /carts/1
  # DELETE /carts/1.json
  def destroy
    @cart = current_cart
    @cart.line_items.destroy_all
    @cart.save
    if @cart.order_preview == nil
    flash[:success] = "Cart Now Empty"
    redirect_to products_path
    else
    @cart.order_preview.delete 
    flash[:success] = "Cart Now Empty"
    redirect_to products_path
  end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cart
        @cart = current_cart
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cart_params
      params.require(:cart).permit(:total_weight)

    end
    def mail_subscriber_params
      params.fetch(:mail_subscriber, {}).permit(:email, :name)
    end 

end
