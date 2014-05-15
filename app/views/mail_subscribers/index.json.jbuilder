json.array!(@mail_subscribers) do |mail_subscriber|
  json.extract! mail_subscriber, :id, :email, :name
  json.url mail_subscriber_url(mail_subscriber, format: :json)
end
