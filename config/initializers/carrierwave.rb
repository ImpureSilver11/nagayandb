# frozen_string_literal: true

require 'carrierwave/orm/activerecord'
require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.development? || Rails.env.test?
  CarrierWave.configure do |config|
    config.storage :file
    config.enable_processing = false if Rails.env.test?
  end
else
  CarrierWave.configure do |config|
    config.storage :fog
    config.fog_directory = Rails.application.credentials.dig(:aws, :bucket)
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.dig(:aws, :access_key_id),
      aws_secret_access_key: Rails.application.credentials.dig(:aws, :secret_access_key),
      region: Rails.application.credentials.dig(:aws, :region),
      path_style: true
    }
    config.asset_host = "http://s3.amazonaws.com/#{Rails.application.credentials.dig(:aws, :bucket)}"
    config.fog_public = false
    config.remove_previously_stored_files_after_update = false
  end
end
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:].\-+]/
