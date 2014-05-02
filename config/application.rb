require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module DArt
  class Application < Rails::Application
    config.generators do |g|
      g.test_framework :rspec,
        :fixtures => true,
        :view_specs => false,
        :helper_specs => false,
        :routing_specs => false,
        :controller_specs => true,
        :request_specs => true
      g.fixture_replacement :factory_girl, :dir => "spec/factories"
    end

    config.paperclip_defaults = {
      :storage => :s3,
      :s3_credentials => {
        :bucket => ENV["S3_BUCKET"],
        :access_key_id => ENV["S3_ACCESS_KEY"],
        :secret_access_key => ENV["S3_SECRET_KEY"]
      }
    }

    config.initialize_on_precompile = false
    config.assets.paths << "#{Rails.root}/app/assets/fonts"
  end
end
