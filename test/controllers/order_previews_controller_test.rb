require 'test_helper'

class OrderPreviewsControllerTest < ActionController::TestCase
  setup do
    @order_preview = order_previews(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:order_previews)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create order_preview" do
    assert_difference('OrderPreview.count') do
      post :create, order_preview: { address2: @order_preview.address2, address: @order_preview.address, cart_id: @order_preview.cart_id, city: @order_preview.city, country: @order_preview.country, cylinder: @order_preview.cylinder, email: @order_preview.email, height: @order_preview.height, length: @order_preview.length, name: @order_preview.name, state: @order_preview.state, weight: @order_preview.weight, width: @order_preview.width, zip: @order_preview.zip }
    end

    assert_redirected_to order_preview_path(assigns(:order_preview))
  end

  test "should show order_preview" do
    get :show, id: @order_preview
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @order_preview
    assert_response :success
  end

  test "should update order_preview" do
    patch :update, id: @order_preview, order_preview: { address2: @order_preview.address2, address: @order_preview.address, cart_id: @order_preview.cart_id, city: @order_preview.city, country: @order_preview.country, cylinder: @order_preview.cylinder, email: @order_preview.email, height: @order_preview.height, length: @order_preview.length, name: @order_preview.name, state: @order_preview.state, weight: @order_preview.weight, width: @order_preview.width, zip: @order_preview.zip }
    assert_redirected_to order_preview_path(assigns(:order_preview))
  end

  test "should destroy order_preview" do
    assert_difference('OrderPreview.count', -1) do
      delete :destroy, id: @order_preview
    end

  end
end
