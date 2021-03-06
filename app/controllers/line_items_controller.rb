class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  def create
    @cart = current_cart
      #product = Product.find_by(params[:id])
      #@line_item = @cart.add_product(product.id)
      @line_item = @cart.line_items.build(line_item_params)
      respond_to do |format|
      if  @line_item.save
          @line_item.set_cart_units
          @line_item.set_cart_weight
        format.html { redirect_to products_path, 
          :notice => "(#{@line_item.quantity}) #{@line_item.product.title} Added to Cart." }
        format.xml  { render :xml => @line_item,
          :status => :created, :location => @line_item }
      else
        format.xml  { render :xml => @line_item.errors,
          :status => :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    @line_item.attributes = line_item_params
      if @line_item.over_order_cap?
        @line_item.quantity = 5
        @line_item.save
        @line_item.set_cart_weight
        @line_item.set_cart_units
        flash[:error] = "#{view_context.link_to('Contact Us', new_contact_path)} For Orders of This Size".html_safe
        redirect_to cart_path
      else
        @line_item.update(line_item_params)
            @line_item.set_cart_weight
            @line_item.set_cart_units

        if @line_item.quantity <= 0
           @line_item.destroy
              flash[:success] = "Item Removed"
              redirect_to :back
        else  
              flash[:success] = "Producted Updated"
              redirect_to cart_path
        end
      end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_line_item
      @line_item = LineItem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def line_item_params
      params.fetch(:line_item, {}).permit(:product_id, :cart_id, :quantity, :weight, :units)
    end
end
