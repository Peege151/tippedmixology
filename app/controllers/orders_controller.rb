class OrdersController < ApplicationController
  # before_action :set_order, only: [:show, :edit, :update, :destroy]
    after_action :new_cart, only: [:show]
    def index
      @orders = Order.all
    end

    def show
        @cart = current_cart

        @order = @cart.order
        @line_items = @order.items
        rescue ActiveRecord::RecordNotFound
              logger.error "User Refresh Page"
              redirect_to products_path
            raise
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
    def new_cart
      @cart = @order.cart
      @cart.delete
    end
    def order_params
      params.require(:order).permit(:name, :address, :address2, :zip, :city, :state, :country, :length, :width, :height, :weight, :cylinder)
    end
end

