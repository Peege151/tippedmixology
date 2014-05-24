json.array!(@order_previews) do |order_preview|
  json.extract! order_preview, :id, :name, :address, :address2, :city, :state, :zip, :width, :height, :length, :weight, :cylinder, :country, :cart_id, :email
  json.url order_preview_url(order_preview, format: :json)
end
