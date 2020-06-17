Rails.application.config.middleware.use OmniAuth::Builder do
  #binding.pry
  # provider :twitter, Rails.application.secrets.omniauth_provider_key, Rails.application.secrets.omniauth_provider_secret
  provider :twitter, ENV["OMNIAUTH_PROVIDER_KEY"], ENV["OMNIAUTH_PROVIDER_SECRET"]
end
