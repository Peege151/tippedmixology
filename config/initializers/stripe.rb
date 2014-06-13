Rails.configuration.stripe = {
  :publishable_key => pk_test_bqdvwmEFZzufQOI01taGdkDr,
  :secret_key      => sk_test_Dqq9iDrvWt4Yf7YQjKmmPvzs
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]