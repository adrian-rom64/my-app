if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: 'AKIAURURPILK2TSYM6GB',
      aws_secret_access_key: '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'
    }
    config.fog_directory = ENV['adrian-rails-app-2019-bucket']
  end
end