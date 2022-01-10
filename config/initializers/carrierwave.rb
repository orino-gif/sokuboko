require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|
  config.storage :fog
  config.fog_provider = 'fog/aws'
  config.fog_public = false
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'], # アクセスキー
    aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'], # シークレットアクセスキー
    region: 'ap-northeast-1', # リージョン
    path_style: true
  }
  if Rails.env.production? # 本番環境の場合は、アップロードとリンク先をバケットsokubokoに指定
    config.fog_directory  = ENV['S3_BUCKET'] # バケット名
  elsif Rails.env.test?# テスト環境の場合はアップロードとリンク先を選択
    config.fog_directory  = ENV['S3_BUCKET'] # バケット名
  else # それ以外の場合は、アップロードとリンク先をillustlife-storage-testに指定
    config.fog_directory  = ENV['S3_BUCKET'] # バケット名
  end
end