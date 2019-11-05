if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAURURPILKTREXCG4E',
      aws_secret_access_key: '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',
      region: 'eu-west-2'
    }
    config.fog_directory = 'adrian-rails-app-2019-bucket'
    config.fog_public = false
  end
end