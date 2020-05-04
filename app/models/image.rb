# frozen_string_literal: true

class Image < ApplicationRecord
  belongs_to :entertainer
  # mount_uploader :image, ImageUploader

  def presigned_url
    Aws::S3::Presigner.new(client: s3_client)
                      .presigned_url(
                        :get_object,
                        bucket: Rails.application.credentials.dig(:aws, :bucket),
                        key: file_path,
                        expires_in: 60
                      )
  end

  def file_path
    # TODO: create filename
    "#{path}.#{file_type}"
  end

  def s3_client
    Aws::S3::Resource.new(
      region: Rails.application.credentials.dig(:aws, :region),
      credentials: Aws::Credentials.new(
        Rails.application.credentials.dig(:aws, :access_key_id),
        Rails.application.credentials.dig(:aws, :secret_access_key)
      )
    ).client
  end
end
