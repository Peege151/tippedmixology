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
      product = Product.find(params[:product_id])
      @line_item = @cart.add_product(product.id)
      @line_item.product = product

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to(@line_item.cart,
          :notice => 'Item Added to Cart.') }
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
      @cart = current_cart
      product = @line_item.product_id
      @line_item = @cart.remove_product(product)
        if @line_item.quantity > 0
           @line_item.update_attributes(params[:line_item])
           flash[:success] = "Item Removed!"
           redirect_to @line_item.cart
        else
            @line_item.destroy
            redirect_to :back
            flash[:success] = "Item Removed!"
        end 
        # format.html { redirect_to current_cart, notice: 'Line item was successfully updated.' }
        # format.json { head :no_content }

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
      params.fetch(:line_item, {}).permit(:product_id, :cart_id, :quantity)
    end
end
