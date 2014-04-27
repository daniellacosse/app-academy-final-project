Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'], {
    scope: 'email,user_birthday', 
    image: 'large', 
    provider_ignores_state: true
  }
end
