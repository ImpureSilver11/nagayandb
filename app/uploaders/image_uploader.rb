# frozen_string_literal: true

class ImageUploader < CarrierWave::Uploader::Base
  include CarrierWave::MiniMagick

  # このアップローダーに使用するストレージの種類を選択してください：
  if Rails.env.development? || Rails.env.test?
    storage :file
  else
    storage :fog
  end

  # アップロードされたファイルが保存されるディレクトリを上書きします。
  # これは、マウントされることを意図したアップローダーの賢明なデフォルトです。
  def store_dir
    # "public/images/#{model.id}"
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  # ファイルがアップロードされていない場合は、デフォルトのURLをデフォルトとして指定します。
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # アップロード時にファイルを処理します。
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # アップロードしたファイルの異なるバージョンを作成します。
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # アップロードを許可する拡張機能のホワイトリストを追加します。
  # 画像の場合、次のようなものを使用できます。
  def extension_whitelist
    %w(jpg jpeg gif png)
  end

  # アップロードされたファイルのファイル名を上書きします。
  # ここでmodel.idまたはversion_nameを使用しないでください。詳細については、uploader / store.rbを参照してください。
  def filename
    "#{SecureRandom.uuid}.jpg" if original_filename
  end
end
