# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  if Rails.env.production?
    storage :fog
  else
    storage :file
  end

  def size_range
    1..5.megabytes
  end

  def store_dir
    model.entertainer.name
  end

  # アップロードを許可する拡張機能のホワイトリストを追加します。
  # 画像の場合、次のようなものを使用できます。
  def extension_whitelist
    %w[jpg jpeg gif png]
  end

  # アップロードされたファイルのファイル名を上書きします。
  # ここでmodel.idまたはversion_nameを使用しないでください。詳細については、uploader / store.rbを参照してください。
  def filename
    "#{secure_token}.#{file.extension}" if original_filename.present?
  end

  protected

  def secure_token
    var = :"@#{mounted_as}_secure_token"
    model.instance_variable_get(var) or model.instance_variable_set(var, SecureRandom.uuid)
  end
end
