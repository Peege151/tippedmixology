class OrdersController < ApplicationController
  # before_action :set_order, only: [:show, :edit, :update, :destroy]
    def index
      @orders = Order.all
    end

    def show
        @order = Order.find(params[:id])
        @cart = current_cart
    end

    def new
      @cart = current_cart
        if @cart.line_items.empty?
          redirect_to :back, :notice => "Your cart is empty"
          return
        end
        @order = Order.new
    end

    def create
      @cart = current_cart
      @order = @cart.build_order(order_params)
      if @order.save
        redirect_to @order, notice: "The order has been successfully created.  Below are your shipping options."
      else
        render action: "new"
      end
    end

    def edit
      @order = Order.find(params[:id])
    end

    def update
      @order = Order.find(params[:id])
      if @order.update_attributes(order_params)
        redirect_to @order, notice: "The order has been successfully updated.  Below are your shipping options."
      else
        render action: "edit"
      end
    end

private

    def order_params
      params.require(:order).permit(:name, :address, :address2, :zip, :city, :state, :country, :length, :width, :height, :weight, :cylinder)
    end
end

